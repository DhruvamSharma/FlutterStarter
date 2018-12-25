import 'package:flutter/material.dart';

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
              child: Text("Cancel")),
          RaisedButton(onPressed: () {
            login();
          },
            child: Text("Login"),
          ),
        ],
      ),
    );


  }

  Widget _fields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _userNameController,
          decoration: InputDecoration(
            filled: true,
            labelText: 'Username',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32)),
          ),
        ),
        // spacer
        SizedBox(height: 12.0),
        // [Password]
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            filled: true,
            labelText: 'Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32)
            )
          ),
          obscureText: true,
        ),
      ],
    );
  }

  finishApp() {
    _passwordController.clear();
    _userNameController.clear();
  }

  login() {
    Navigator.pop(context);
  }
}