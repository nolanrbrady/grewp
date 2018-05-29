import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {

  @override
  _EventsPage createState() => new _EventsPage();
}

class _EventsPage extends State<EventsPage> {

  // Insert Gloabl Vars Here

  // Insert Functions Here

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text('Events Page'),
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
             child: new Text('Events Flat list will go here'),
           ),
         ],
       ),
     ),
   );
  }
}