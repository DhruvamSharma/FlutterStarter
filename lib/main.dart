import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:flutter_app/Category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyFlutterDebut",
        color: Colors.cyan,
        home: Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            title: Text("Unit Converter",
            style: Theme.of(context).textTheme.headline,
            ),
            elevation: 0.0,
          ),
          body: RandomWords(),
        ));
  }

}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => new RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // returns a word pair for the list

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return CategoryWidget(name : pair.asPascalCase,
        color: Colors.amber,
        iconLocation: Icons.print
    );
  }
}
