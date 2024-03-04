abstract class AuthRepository {
  Future<void> googleAuth();
  Future<void> signOut();
  Future<String> getCurrentUid();
  bool get isLoggin;
}
