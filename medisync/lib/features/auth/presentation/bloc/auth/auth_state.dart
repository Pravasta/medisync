part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Authenticated extends AuthState {
  final String uid;

  const Authenticated(this.uid);

  @override
  List<Object> get props => [uid];
}

final class Unauthenticated extends AuthState {
  const Unauthenticated();

  @override
  List<Object> get props => [];
}
