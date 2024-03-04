import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medisync/features/auth/domain/usecases/get_current_uid_usecases.dart';
import 'package:medisync/features/auth/domain/usecases/is_loggin_google_usecases.dart';
import 'package:medisync/features/auth/domain/usecases/signout_google_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignOutUsecases _signOutUsecases;
  final IsLoginUsecases _isLoginUsecases;
  final GetCurrentUidUsecases _getCurrentUidUsecases;

  AuthBloc(
    this._signOutUsecases,
    this._isLoginUsecases,
    this._getCurrentUidUsecases,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<OnAuthenticatedEvent>((event, emit) async {
      try {
        final uid = await _getCurrentUidUsecases.call();
        emit(Authenticated(uid));
      } catch (e) {
        emit(const Unauthenticated());
      }
    });

    on<OnUnAuthenticatedEvent>((event, emit) async {
      try {
        await _signOutUsecases.call();
        emit(const Unauthenticated());
      } catch (e) {
        emit(const Unauthenticated());
      }
    });

    on<OnIsSignInEvent>((event, emit) async {
      try {
        bool isSignIn = _isLoginUsecases.call();
        if (isSignIn == true) {
          final uid = await _getCurrentUidUsecases.call();
          emit(Authenticated(uid));
        } else {
          emit(const Unauthenticated());
        }
      } catch (e) {
        emit(const Unauthenticated());
      }
    });
  }
}
