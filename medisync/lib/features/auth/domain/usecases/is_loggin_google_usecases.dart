import 'package:medisync/features/auth/domain/repositories/auth_repositories.dart';

class IsLoginUsecases {
  final AuthRepository _authRepository;

  IsLoginUsecases(this._authRepository);

  bool call() {
    return _authRepository.isLoggin;
  }
}
