import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListWidget extends StatefulWidget{
  @override
  _ListWidgetState createState() => new _ListWidgetState();

}

class _ListWidgetState extends State<ListWidget>{

  final _namePairs = <WordPair> [];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemBuilder: (context,i) {
          if(i.isOdd )
            return Divider();


          final index = i ~/2;
          if(index >= _namePairs.length)
            _namePairs.addAll(generateWordPairs().take(10));


          return _buildRow(_namePairs[index]);
        },
        itemCount: 100,
    );

  }

  Widget _buildRow(WordPair namePair) {
    return Material(
      child: InkWell(
        splashColor: Colors.cyan,
        onTap: () {
          print("tapped");
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            title: Text(namePair.asPascalCase,
              style: TextStyle(fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

}