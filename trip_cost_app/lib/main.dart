import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  List<String> currencies = ['Dollars', 'Euro', 'Yens'];
  String currency = 'Dollars';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "write a number"
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            DropdownButton<String>(
              items: currencies.map((String f) {
                return DropdownMenuItem<String> (
                  value: f,
                  child: Text(f),
                );
              }).toList(),
              value: currency,
              onChanged: (String value) {
                onDropDownValueSelected(value);
              },
            ),
            Text(name)
          ],
        )
      )
    );
  }

  void onDropDownValueSelected(String value) {
    setState(() {
      currency = value;
    });
  }

}
