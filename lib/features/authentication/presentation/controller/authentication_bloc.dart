import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../data/repositories/authentication_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

@lazySingleton
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authRepository = getIt<AuthenticationRepository>();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<CheckTokenEvent>((event, emit) async {
      await _checkToken(emit);
    });

    on<LoginEvent>((event, emit) async {
      await _login(emit, event);
    });

    on<FetchUserInfoEvent>((event, emit) async {
      await _getUserInfo(emit);
    });

    on<RefreshTokenEvent>((event, emit) async {
      await _refreshToken(emit);
    });

    add(CheckTokenEvent());
  }

  Future<void> _checkToken(Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      if (authRepository.hasToken()) {
        add(FetchUserInfoEvent());
      } else {
        emit(AuthenticationInitial());
      }
    } catch (error) {
      emit(AuthenticationFailure('Token validation failed: $error'));
    }
  }

  Future<void> _refreshToken(Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final newLoginModel = await authRepository.refreshToken();
      if (newLoginModel.message.isEmpty) {
        emit(TokenRefreshed(newLoginModel));
      } else {
        emit(AuthenticationFailure(newLoginModel.message.toString()));
      }
    } catch (error) {
      emit(AuthenticationFailure(error.toString()));
    }
  }

  Future<void> _login(Emitter<AuthenticationState> emit, LoginEvent event) async {
    emit(AuthenticationLoading());
    try {
      final loginModel = await authRepository.login(
        userName: event.userName,
        password: event.password,
      );
      if (loginModel.message.isEmpty) {
        emit(AuthenticationSuccess(loginModel));
        add(FetchUserInfoEvent());
      } else {
        emit(AuthenticationFailure(loginModel.message.toString()));
      }
    } catch (error) {
      emit(AuthenticationFailure(error.toString()));
    }
  }

  Future<void> _getUserInfo(Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final userInfo = await authRepository.userInfo();
      if (userInfo.message.isEmpty) {
        emit(UserInfoLoaded(userInfo));
      } else {
        emit(AuthenticationFailure(userInfo.message.toString()));
      }
    } catch (error) {
      emit(AuthenticationFailure(error.toString()));
    }
  }
}