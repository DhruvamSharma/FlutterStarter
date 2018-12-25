import 'package:flutter/material.dart';


class ConverterWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return _ConverterWidgetState();
  }


}

class _ConverterWidgetState extends State<ConverterWidget> {



  String _label = "Input";
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: TextField(
          controller: myController,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline,
          decoration: InputDecoration(
            labelText: _label,
            labelStyle: Theme.of(context).textTheme.headline,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
      ),
    );
  }

  convert() {

    print("my text is ${myController.text}");

  }

  @override
  void initState() {
    super.initState();
    myController.addListener(convert);
  }




}