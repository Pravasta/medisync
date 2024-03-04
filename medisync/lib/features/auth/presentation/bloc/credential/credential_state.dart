part of 'credential_bloc.dart';

sealed class CredentialState extends Equatable {
  const CredentialState();

  @override
  List<Object> get props => [];
}

final class CredentialInitial extends CredentialState {}

final class CredentialLoading extends CredentialState {
  @override
  List<Object> get props => [];
}

final class CredentialSucces extends CredentialState {
  @override
  List<Object> get props => [];
}

final class CredentialFailure extends CredentialState {
  @override
  List<Object> get props => [];
}
