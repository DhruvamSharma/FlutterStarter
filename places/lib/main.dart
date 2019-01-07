import 'package:flutter/material.dart';
import 'package:places/ui/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: "We Rate Dogs",),
      title: "MyDogs",
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

