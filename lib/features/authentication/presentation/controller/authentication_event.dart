// authentication_event.dart

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String userName;
  final String password;

  LoginEvent({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}

class FetchUserInfoEvent extends AuthenticationEvent {}

class RefreshTokenEvent extends AuthenticationEvent {}