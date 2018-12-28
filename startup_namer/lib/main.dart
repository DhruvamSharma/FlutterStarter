import 'package:flutter/material.dart';
import 'package:startup_namer/list_widget.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartupRunner",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: ListWidget(),
    );
  }

  
}