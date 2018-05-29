import 'package:flutter/material.dart';
// Import Pages
import 'messages.dart';
import 'events.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePage createState() => new _HomePage();
}



class _HomePage extends State<HomePage> {

  // Insert Gloabl Vars Here

  // Insert Functions Here

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome Back'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.message),
            onPressed: (){
               Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new ChatPage()));
            },
          )
        ],
        leading: new IconButton(
          icon: new Icon(Icons.event),
          onPressed: (){
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new EventsPage()));
          },
        ),
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('This is the Users Dashboard of sorts'),
            )
          ],
        ),
      )
    );
  }
}