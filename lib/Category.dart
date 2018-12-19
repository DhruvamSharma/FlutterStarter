import 'package:flutter/material.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryWidget extends StatelessWidget {

  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  /// A constructor that helps in managing the dynamic
  ///  attributes for the list.
  const CategoryWidget({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
  }) : assert(name != null),
    assert(color != null),
    assert(iconLocation != null),
    super(key : key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: InkWell(
          splashColor: color,
          highlightColor: color,
          onTap: () {
            //TODO Logic goes here
          },
          child: Container(
                  height: 100,
                  padding: EdgeInsets.all(8.0),
                  child: _rowWidget(name, iconLocation),
      ),
      ),
    );
  }

}

Widget _rowWidget(String name, IconData iconLocation) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              iconLocation ,
              size: 60.0,
            )
        ),
        Text(name,
          style: TextStyle(fontSize: 24.0,
            fontStyle: FontStyle.italic,
            decorationStyle: TextDecorationStyle.dashed,
          ),
          textAlign: TextAlign.center,

        ),
      ],
    ),
  );
}