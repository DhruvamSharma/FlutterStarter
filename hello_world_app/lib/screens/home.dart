import 'package:flutter/material.dart';

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Flutter Endeavour"),
        ),
        body: Material(
          color: Colors.deepPurple,
          child: Center(
            child: Text(
              greetUser(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 29.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String greetUser() {
    String greet;
    DateTime now = DateTime.now();
    int minute = now.minute;
    int hour = now.hour;
    if(hour < 12) {
      greet = 'Good Morning';
    } else if( hour < 18) {
      greet = 'Good evening';
    } else {
      greet = 'Good Night';
    }
    String nowMinute = minute < 10? ' ${hour}:0${minute}': ' ${hour}:${minute}';
    return greet + nowMinute;
  }

}