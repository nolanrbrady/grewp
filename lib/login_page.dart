import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
// Import Pages
import 'home.dart';
import 'messages.dart';
import 'create_account.dart';
// Importing Firebase Auth
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grewp/services/auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  // Authentication Initiation
  UserData authUser = new UserData();

  String _email = '';
  String _password = '';

  void _submitLogin() async {
    print("Email: " + _email);
    print("Password: " + _password);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: new InputDecoration(
                hintText: "Username",
                labelText: "Enter your Username"
              ),
              onChanged: (String value){
                authUser.email = value;
              },
            ),
            new TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                hintText: "Password",
                labelText: "Enter your Password"
              ),
              onChanged: (String value){
                authUser.password = value;
              },
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: new Text('Login'),
                    onPressed: (){
                      _submitLogin();
                      Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => new HomePage()));
                    },
                  ),
                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    child: new Text('Create Account'),
                    textColor: Theme.of(context).accentColor,
                    onPressed: (){
                      print("Create Account Button Pressed");
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new CreateAccount()));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


