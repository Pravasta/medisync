import 'package:medisync/features/auth/domain/repositories/auth_repositories.dart';

class SignOutUsecases {
  final AuthRepository _authRepository;

  SignOutUsecases(this._authRepository);

  Future<void> call() {
    return _authRepository.signOut();
  }
}
