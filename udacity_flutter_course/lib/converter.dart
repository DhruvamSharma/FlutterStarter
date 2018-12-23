import 'package:flutter/material.dart';

class UnitConverterScreen extends StatefulWidget {

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
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return UnitConverterScreenState(color: color, title: title);
  }

}

class UnitConverterScreenState extends State<UnitConverterScreen> {

  Color color;
  String title;

  UnitConverterScreenState({
    @required this.color,
    @required this.title


  }) : assert(color != null),
        assert(title != null);

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