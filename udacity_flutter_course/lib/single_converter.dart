import 'package:flutter/material.dart';


class ConverterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.body1,
          decoration: InputDecoration(
            labelText: "Input",
            labelStyle: Theme.of(context).textTheme.body1,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
      ),
    );
  }
}