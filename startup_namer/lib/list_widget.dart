import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:startup_namer/favourites.dart';

class ListWidget extends StatefulWidget{
  @override
  _ListWidgetState createState() => new _ListWidgetState();

}

class _ListWidgetState extends State<ListWidget>{

  final _namePairs = <WordPair> [];
  final Set<WordPair> _savedPairs = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list,
            color: Colors.white,
          ),
            onPressed: _displaySavedList,
          )
        ],
        elevation: 0,
        title: Text("Startup Namer",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context,i) {
            if(i.isOdd )
              return Divider();


            final index = i ~/2;
            if(index >= _namePairs.length)
              _namePairs.addAll(generateWordPairs().take(10));

            return _buildRow(_namePairs[index]);
          },
      ),
    );

  }

  Widget _buildRow(WordPair namePair) {

    final bool _alreadySaved = _savedPairs.contains(namePair);

    return Material(
      child: InkWell(
        splashColor: Colors.red,
        onTap: () {
          print("tapped");
          setState(() {
            if(!_savedPairs.contains(namePair))
              _savedPairs.add(namePair);
            else
              _savedPairs.remove(namePair);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            title: Text(namePair.asPascalCase,
              style: TextStyle(fontSize: 16.0,
              ),
            ),
            trailing: Icon(
              _alreadySaved? Icons.favorite: Icons.favorite_border,
              color: _alreadySaved? Colors.red: null,
            ),


          ),
        ),
      ),
    );
  }

 void _displaySavedList() {

    if(Navigator.of(context).canPop())
    {
      Navigator.of(context).pop();
    }

    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return FavouritesWidget(savedPairs: _savedPairs);
        }
    ));
  }


}