// authentication_state.dart

import 'package:equatable/equatable.dart';
import '../../data/entities/login/login_model.dart';
import '../../data/entities/user_info/user_info_model.dart';


abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final LoginModel loginModel;

  AuthenticationSuccess(this.loginModel);

  @override
  List<Object?> get props => [loginModel];
}

class UserInfoLoaded extends AuthenticationState {
  final UserInfoModel userInfo;

  UserInfoLoaded(this.userInfo);

  @override
  List<Object?> get props => [userInfo];
}

class TokenRefreshed extends AuthenticationState {
  final LoginModel newLoginModel;

  TokenRefreshed(this.newLoginModel);

  @override
  List<Object?> get props => [newLoginModel];
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure(this.error);

  @override
  List<Object?> get props => [error];
}