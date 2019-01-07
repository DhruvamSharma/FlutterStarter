import 'package:flutter/material.dart';
import 'package:places/bloc/DoggoBloc.dart';
import 'package:places/models/dog_model.dart';
import 'package:places/ui/dog_card.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({
    Key key,
    @required this.title,
  }): assert(title !=null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: FutureBuilder(
          builder: (context, AsyncSnapshot<DogModel> snapshot) {
            if(snapshot.hasData) {
              return DogCard(model: snapshot.data);
            }
            return CircularProgressIndicator();
          },
        future: bloc.fetchDogs(),
      ),
    );
  }
}
