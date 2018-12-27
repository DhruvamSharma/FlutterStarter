import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/cut_corners_border.dart';
import 'package:shrine/gallery.dart';

class LoginScreen extends StatefulWidget {

  final String title;

  const LoginScreen({
    Key key,
    @required this.title,
}): assert(title != null),
  super(key:key);

  @override
  createState() => new LoginScreenState(title: title);

}

class LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String title;
  LoginScreenState({
    @required this.title,
}): assert(title != null);



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(title ,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                Icon(Icons.access_alarm,
                  size: 64,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(
                    title, style: TextStyle(
                      fontSize: 24),
                  )
                  ),
                ),
              ],
            ),
          ),

          Center(child: _fields()),
          Center(child: _buttons()),
        ],
      ),
    );
  }

  Widget _buttons() {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonBar(
        children: <Widget>[
          FlatButton(onPressed: () {
            finishApp();
          },
              child: Text("Cancel"),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))
            ),
          ),
          RaisedButton(onPressed: () {
            login();
          },
            child: Text("Login"),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))
            ),
            elevation: 8,
          ),
        ],
      ),
    );


  }

  Widget _fields() {
    return Column(
      children: <Widget>[
        AccentColorOverride(
          color: kShrineBrown900,
          child: TextField(
            controller: _userNameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: CutCornersBorder(

              )
            ),
          ),
        ),
        // spacer
        SizedBox(height: 12.0),
        // [Password]
        AccentColorOverride(
          color: const Color(0xFF442B2D),
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: CutCornersBorder(),
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }

  finishApp() {
    _passwordController.clear();
    _userNameController.clear();
  }

  login() {

    if(Navigator.of(context).canPop())
      Navigator.of(context).pop();

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) {
          return GalleryScreen();
        },
      )
    );

  }
}


class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
          accentColor: color,
          brightness: Brightness.dark),
    );
  }
}