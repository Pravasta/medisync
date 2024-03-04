part of 'credential_bloc.dart';

sealed class CredentialEvent extends Equatable {
  const CredentialEvent();

  @override
  List<Object> get props => [];
}

class OnGoogleAuthCredential extends CredentialEvent {}
