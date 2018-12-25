import 'package:flutter/material.dart';
import 'package:udacity_flutter_course/single_converter.dart';

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
    return _UnitConverterScreenState(color: color, title: title);
  }

}

class _UnitConverterScreenState extends State<UnitConverterScreen> {

  Color color;
  String title;

  _UnitConverterScreenState({
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
      body: Column(
        children: <Widget>[
          ConverterWidget(),
          Icon(Icons.compare_arrows,
            color: color,
          ),
          ConverterWidget()
        ],
      ),
    );
  }
}