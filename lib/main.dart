import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Text(WordPair("hello", "bye").asPascalCase),
        ),
      ),
    );
  }
}
