import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _gUser;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _authErrorMsg = '';
  String get errorMsg => _authErrorMsg;

  GoogleSignInAccount get gUser => _gUser!;

  Future googleLogin() async {
    log('g-loggin');
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    _gUser = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final auth = await _firebaseAuth.signInWithCredential(credential);
      log(auth.user!.uid);
      log(auth.user!.displayName!);
    } on FirebaseAuthException catch (e) {
      _authErrorMsg = e.message!;
      log(_authErrorMsg);
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      _authErrorMsg = e.message!;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
final authStateProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());
