import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPage createState() => new _ChatPage();
}

class _ChatPage extends State<ChatPage>{
  // Insert Global Vars

  // Insert Global Functions

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Chat'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Chat App Goes here'),
            ),
          ],
        ),
      ),
    );
  }
}