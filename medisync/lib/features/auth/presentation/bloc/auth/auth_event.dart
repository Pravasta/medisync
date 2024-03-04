part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnAuthenticatedEvent extends AuthEvent {}

class OnUnAuthenticatedEvent extends AuthEvent {}

class OnIsSignInEvent extends AuthEvent {}
