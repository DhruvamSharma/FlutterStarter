import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
  print("myData");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HelloRectangle(),
    );
  }
}


class HelloRectangle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _container = Container(
      color: Colors.cyan,
      margin: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children : <Widget>[
            Text("Hello"),
            Text("Bye"),
          ],
        ),
      ),

    );

    return Scaffold (
      appBar: AppBar(
        title: Text("Title"),
        backgroundColor: Colors.amber,
      ),
      body : Center(
        child: _container,
      )
    );

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

          if(i.isOdd) return Divider();

          final index = i ~/ 2;

          if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
    
  }


  Widget _buildRow(WordPair pair) {

    return ListTile(
      title: Text(
        pair.asPascalCase,
      ),
    );

  }



}
