import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text('Sign In with Google'),
              onPressed: () async {
                await _googleSignIn.signIn();
                setState(() {});
              },
            ),
            ElevatedButton(
              child: Text('Sign Out'),
              onPressed: () async {
                await _googleSignIn.signOut();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
