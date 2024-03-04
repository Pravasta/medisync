import 'package:medisync/features/auth/domain/repositories/auth_repositories.dart';

class GoogleAuthUsecases {
  final AuthRepository _authRepository;

  GoogleAuthUsecases(this._authRepository);

  Future<void> call() {
    return _authRepository.googleAuth();
  }
}
