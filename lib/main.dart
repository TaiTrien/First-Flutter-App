import 'package:bt1/random_word.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        body: Center(
          child: RandomWord(), // With this text.
        ),
      ),
    );
  }
}
