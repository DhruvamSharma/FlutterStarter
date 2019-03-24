import 'package:bloc_pattern/src/ui/movie_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'BlocApp',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Pattern"),
        ),
        body: MovieList(),
      ),
    );
  }
}