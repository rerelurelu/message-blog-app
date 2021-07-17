import 'package:flutter/material.dart';

import 'package:message_blog/views/auth_view.dart';

void main() {
  runApp(MessageBlogApp());
}

class MessageBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Blog',
      theme: ThemeData.light(),
      home: AuthView(),
    );
  }
}
