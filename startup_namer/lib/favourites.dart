import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavouritesWidget extends StatelessWidget {
  final Set<WordPair> savedPairs;

  FavouritesWidget({
    Key key,
    @required this.savedPairs,
  })  : assert(savedPairs != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print(savedPairs.length);

    final Iterable<Widget> tiles = savedPairs.map(
      (WordPair pair) {
        return ListTile(
          title: new Text(
            pair.asPascalCase,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Pairs",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: ListView(children: divided,)
    );
  }


}
