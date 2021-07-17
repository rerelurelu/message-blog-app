import 'package:flutter/material.dart';

import './views/home_view.dart';

void main() {
  runApp(MessageBlogApp());
}

class MessageBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Blog',
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
