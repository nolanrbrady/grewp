import 'dart:async';
import 'package:flutter/material.dart';
// Firebase Packages
import 'package:grewp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccount createState() => new _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  String statusMsg = "Account Successfully Creates";
// Declaring Firebase Vars
UserData newUser = new UserData();

Future<String> _handleCreateUser() async {
  await _auth.createUserWithEmailAndPassword(
    email: newUser.email,
    password: newUser.password).catchError((err) =>
      print("There was an error: "));
    return statusMsg;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Create an Account'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  hintText: 'Name',
                  labelText: 'What\'s Your Name'
                ),
                onChanged: (String value){
                  newUser.name = value;
                },
              ),
              new TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  hintText: 'Email',
                  labelText: 'Your Email Goes Here'
                ),
                onChanged: (String value){
                  newUser.email = value;
                },
              ),
              new TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: 'Password',
                  labelText: 'Your New Password Goes Here'
                ),
                onChanged: (String value){
                  newUser.password = value;
                },
              ),
              new Padding(
                padding: const EdgeInsets.all(12.0),
                child: new RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: new Text('Create Account'),
                  onPressed: (){
                    print(newUser.name);
                    print(newUser.email);
                    print(newUser.password);
                    _handleCreateUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}