import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Holder _holder = Holder();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FuelPage(title: 'Trip Cost Calculator'),
    );
  }
}

class FuelPage extends StatefulWidget {
  final String title;
  FuelPage({this.title});
  @override
  State<StatefulWidget> createState() => _FuelPageState();
}

class _FuelPageState extends State<FuelPage> {
  String value = "";
  TextEditingController distanceFieldController = TextEditingController();
  TextEditingController mileageFieldController = TextEditingController();
  TextEditingController priceFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("in home page state");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: distanceFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "eg. 125",
                    labelText: 'Distance',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: mileageFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "eg. 12.4",
                      labelText: 'Distance per Unit',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: priceFieldController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "eg. 89",
                            labelText: 'Price',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                      ),
                    ),
                    Container(width: 45,),
                    Expanded(child: _DropDownListWidget()),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Calculate"),
                        onPressed: () {
                      setState(() {
                        this.value = calculate();
                      });
                    }),
                  ),
                  Expanded(
                    child: OutlineButton(
                      child: Text("Reset"),
                        onPressed: () {
                          setState(() {
                            distanceFieldController.clear();
                            mileageFieldController.clear();
                            priceFieldController.clear();
                            this.value = "0 " + _holder.value;
                          });
                        }),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.value,
                textScaleFactor: 4,
                style: TextStyle(
                  fontFamily: "NotoSans",
                ),),
              )
            ],
          ),
        )
      )
    );
  }

  String calculate() {
    double price = double.parse(priceFieldController.text);
    double mileage = double.parse(mileageFieldController.text);
    double distance = double.parse(distanceFieldController.text);
    double _totalCost = distance/(price*mileage);
    return _totalCost.toStringAsFixed(2) + " " + _holder.value;
  }
}

class _DropDownListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DropDownListWidgetState();
}

class _DropDownListWidgetState extends State<_DropDownListWidget> {
  List<String> currencies = ['Dollars', 'Euro', 'Yens'];
  String value = "Dollars";
  void onDropDownValueSelected(String valuee) {
    setState(() {
      _holder.value = valuee;
      value = valuee;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("in dropdown state");
    return DropdownButton<String> (
      items: currencies.map((String value) {
        return DropdownMenuItem<String> (
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        onDropDownValueSelected(value);
      },
      value: value
    );
  }
}

class Holder {
  String _value = "Dollars";

  String get value => _value;

  set value(String value) {
    _value = value;
  }

}
