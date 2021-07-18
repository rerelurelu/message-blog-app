import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:message_blog/providers/user_provider.dart';

class AuthView extends ConsumerWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final googleAuth = watch(googleAuthProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.redAccent,
              ),
              label: Text('Sign In with Google'),
              onPressed: () {
                googleAuth.googleLogin();
              },
            ),
            ElevatedButton(
              child: Text('Sign Out'),
              onPressed: () {
                googleAuth.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
