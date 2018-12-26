import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kShrineTheme,
      home: LoginScreen(title: "SHRINE"),
    );
  }
}



