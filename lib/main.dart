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
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text("Unit Converter"),
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
      appBar: AppBar(
        title: Text("MyTitle"),
        backgroundColor: Colors.amber,
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
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
