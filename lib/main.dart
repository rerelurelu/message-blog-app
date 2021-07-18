import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:message_blog/views/auth_view.dart';
import 'package:message_blog/views/home_view.dart';
import 'package:message_blog/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ProviderScope(
      child: MessageBlogApp(),
    ),
  );
}

class MessageBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Blog',
      theme: ThemeData.light(),
      home: CheckLogin(),
    );
  }
}

class CheckLogin extends ConsumerWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _googleAuth = watch(googleAuthProvider);
    bool isSignIn = _googleAuth.isSignIn;

    return isSignIn ? HomeView() : AuthView();
  }
}
