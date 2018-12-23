import 'package:flutter/material.dart';

class UnitConverterScreen extends StatelessWidget {

  final Color color;
  final String title;

  const UnitConverterScreen({
    Key key,
    @required this.color,
    @required this.title


}) : assert(color != null),
     assert(title != null),
     super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
    );
  }

}