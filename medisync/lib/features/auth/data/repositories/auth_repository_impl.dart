import 'dart:async';
import 'package:medisync/features/auth/data/datasources/google_auth/auth_remote_datasources.dart';
import 'package:medisync/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;

  AuthRepositoryImpl(this.authRemoteDataSources);

  @override
  bool get isLoggin {
    try {
      return authRemoteDataSources.isLoggin;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> googleAuth() async {
    try {
      await authRemoteDataSources.googleAuth();
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    final succes = await authRemoteDataSources.signOutGoogle();
    return succes;
  }

  @override
  Future<String> getCurrentUid() async {
    try {
      var result = await authRemoteDataSources.getCurrentUid();
      return result;
    } catch (e) {
      throw (e.toString());
    }
  }
}
