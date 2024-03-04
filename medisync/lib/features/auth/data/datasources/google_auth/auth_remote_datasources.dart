import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSources {
  Future<void> googleAuth();
  Future<void> signOutGoogle();
  Future<String> getCurrentUid();
  bool get isLoggin;
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourcesImpl({
    required this.firebaseAuth,
  });

  @override
  bool get isLoggin {
    return firebaseAuth.currentUser?.uid != null;
  }

  @override
  Future<void> googleAuth() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential = await firebaseAuth.signInWithCredential(credential);
      if (kDebugMode) {
        print(userCredential);
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<void> signOutGoogle() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<String> getCurrentUid() async {
    return firebaseAuth.currentUser!.uid;
  }
}
