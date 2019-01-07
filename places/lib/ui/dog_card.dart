import 'package:flutter/material.dart';
import 'package:places/models/dog_model.dart';

class DogCard extends StatefulWidget {
  final DogModel model;
  DogCard({this.model});
  @override
  createState() => DogCardState();
}

class DogCardState extends State<DogCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var circleImage = CircleAvatar(
      backgroundImage: NetworkImage(widget.model.imageUrl),
      radius: 50,
    );

    var dogCard = ;

    var stack = Container(
      height: 115,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 50,
            child: dogCard,
          ),
          Positioned(
              child: circleImage,
            top: 7.5,
          ),
        ],
      ),
    );

    return stack;
  }
}
