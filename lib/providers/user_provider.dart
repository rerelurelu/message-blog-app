import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends StateNotifier<GoogleSignInAccount?> {
  AuthController({GoogleSignInAccount? account}) : super(account) {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      state = _googleSignIn.currentUser;
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
}
