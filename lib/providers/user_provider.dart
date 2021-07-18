import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleAuthProvider = ChangeNotifierProvider((ref) => GoogleSignInProvider());

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSignIn = false;

  GoogleSignInProvider() {
    _isSignIn = false;
  }

  bool get isSignIn => _isSignIn;

  set isSignIn(bool isSignIn) {
    _isSignIn = isSignIn;
    notifyListeners();
  }

  Future googleLogin() async {
    final user = await googleSignIn.signIn();

    if (user == null) {
      isSignIn = false;
      return;
    } else {
      final auth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      isSignIn = true;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
