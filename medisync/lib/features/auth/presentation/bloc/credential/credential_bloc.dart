import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medisync/features/auth/domain/usecases/login_google_auth_usecases.dart';

part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  final GoogleAuthUsecases _googleAuthUsecases;

  CredentialBloc(this._googleAuthUsecases) : super(CredentialInitial()) {
    on<CredentialEvent>((event, emit) {});
    on<OnGoogleAuthCredential>((event, emit) async {
      emit(CredentialLoading());
      try {
        await _googleAuthUsecases.call();
        emit(CredentialSucces());
      } on SocketException {
        emit(CredentialFailure());
      } catch (e) {
        emit(CredentialFailure());
      }
    });
  }
}
