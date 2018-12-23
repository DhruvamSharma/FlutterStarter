// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';
import 'package:udacity_flutter_course/category.dart';

class MyHomeScreen extends StatefulWidget {

  final String title;

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _iconsData = <IconData>[

    Icons.delete,
    Icons.add,
    Icons.cake,
    Icons.print,
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessible_forward,

  ];

  const MyHomeScreen({
    Key key,
    @required this.title,

  }) :  assert (title != null),
        super (key: key);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState(title: title, categoryNames: _categoryNames, baseColors: _baseColors, iconsData: _iconsData);
  }

}

class _HomeScreenState extends State<MyHomeScreen> {

  String title;
  List categoryNames;
  List baseColors;
  List iconsData;

   _HomeScreenState({
     @required this.iconsData,
     @required this.categoryNames,
     @required this.baseColors,
    @required this.title,
}): assert(title != null);

  @override
  Widget build(BuildContext context) {

    final categories = <Category>[];

    for (var i = 0; i < categoryNames.length; i++) {
      categories.add(Category(
        name: categoryNames[i],
        color: baseColors[i],
        iconLocation: iconsData[i],
      ));
    }


    /// This widget helps in building the list
    Widget _buildListWidget(List<Category> categories) {
      return Container(
        child: ListView.builder(
          itemBuilder: ( context, i) => categories[i],
          padding: EdgeInsets.all(16.0),
          itemCount: categories.length,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.amber,
        textTheme: TextTheme(headline: TextStyle(fontSize: 24)),
      ),
      body: _buildListWidget(categories),
    );
  }



}