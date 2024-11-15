import 'package:flutter_test/flutter_test.dart';
import 'package:maidscc_todos/features/authentication/data/data_sources/local/authentication_local_data_source.dart';
import 'package:maidscc_todos/features/authentication/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:maidscc_todos/features/authentication/data/entities/login/login_model.dart';
import 'package:maidscc_todos/features/authentication/data/entities/user_info/user_info_model.dart';
import 'package:maidscc_todos/features/authentication/data/repositories/authentication_reporsitory_imp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_test.mocks.dart';


@GenerateNiceMocks([MockSpec<AuthenticationRemoteDataSource>(), MockSpec<AuthenticationLocalDataSource>()])

void main() {
  late AuthenticationRepositoryImp authenticationRepository;
  late MockAuthenticationRemoteDataSource mockRemoteDataSource;
  late MockAuthenticationLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthenticationRemoteDataSource();
    mockLocalDataSource = MockAuthenticationLocalDataSource();
    authenticationRepository = AuthenticationRepositoryImp(
      mockRemoteDataSource,
      mockLocalDataSource,
    );
  });

  group('login', () {
    const String testUserName = 'test_user';
    const String testPassword = 'test_password';
    const loginModel = LoginModel(
      message: '',
      accessToken: 'valid_token',
      refreshToken: 'valid_refresh_token',
    );

    test('should save tokens locally when login is successful', () async {
      // Arrange
      when(mockRemoteDataSource.login(
        userName: testUserName,
        password: testPassword,
      )).thenAnswer((_) async => loginModel);

      // Act
      final result = await authenticationRepository.login(
        userName: testUserName,
        password: testPassword,
      );

      // Assert
      expect(result, loginModel);
      verify(mockLocalDataSource.setAccessToken('valid_token')).called(1);
      verify(mockLocalDataSource.setRefreshToken('valid_refresh_token')).called(1);
    });
  });

  group('userInfo', () {
    const remoteUserInfo = UserInfoModel(id: 2, firstName: 'Remote User');

    test('should fetch and save user info from remote if local is unavailable', () async {
      // Arrange
      when(mockLocalDataSource.userInfo).thenReturn(const UserInfoModel(id: 0));
      when(mockRemoteDataSource.userInfo()).thenAnswer((_) async => remoteUserInfo);

      // Act
      final result = await authenticationRepository.userInfo();

      // Assert
      expect(result, remoteUserInfo);
      verify(mockRemoteDataSource.userInfo()).called(1);
      verify(mockLocalDataSource.setUserInfo(remoteUserInfo)).called(1);
    });
  });

  group('refreshToken', () {
    const refreshTokenModel = LoginModel(
      message: '',
      accessToken: 'new_access_token',
      refreshToken: 'new_refresh_token',
    );

    test('should update tokens when refresh token is successful', () async {
      // Arrange
      when(mockLocalDataSource.accessToken).thenReturn('old_token');
      when(mockRemoteDataSource.refreshToken(refreshToken: 'old_token'))
          .thenAnswer((_) async => refreshTokenModel);

      // Act
      final result = await authenticationRepository.refreshToken();

      // Assert
      expect(result, refreshTokenModel);
      verify(mockLocalDataSource.setAccessToken('new_access_token')).called(1);
      verify(mockLocalDataSource.setRefreshToken('new_refresh_token')).called(1);
    });
  });

  group('hasToken', () {
    test('should return true if access token is not empty', () {
      // Arrange
      when(mockLocalDataSource.accessToken).thenReturn('valid_token');

      // Act
      final result = authenticationRepository.hasToken();

      // Assert
      expect(result, isTrue);
      verify(mockLocalDataSource.accessToken).called(1);
    });

    test('should return false if access token is empty', () {
      // Arrange
      when(mockLocalDataSource.accessToken).thenReturn('');

      // Act
      final result = authenticationRepository.hasToken();

      // Assert
      expect(result, isFalse);
      verify(mockLocalDataSource.accessToken).called(1);
    });
  });
}