import 'package:medisync/features/auth/domain/repositories/auth_repositories.dart';

class GetCurrentUidUsecases {
  final AuthRepository _authRepository;

  GetCurrentUidUsecases(this._authRepository);

  Future<String> call() {
    return _authRepository.getCurrentUid();
  }
}
