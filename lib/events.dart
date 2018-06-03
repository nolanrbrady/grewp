import 'package:flutter/material.dart';
import 'event_list.dart';

class Events {
  String name;
  String location;
  String description;

  Events({this.name, this.location, this.description});
}

class EventsPage extends StatefulWidget {
  @override
  _EventsPage createState() => new _EventsPage();
}

class _EventsPage extends State<EventsPage> {
  // Insert Gloabl Vars Here
  bool _displayAddEvent = false;

  Events _event = new Events();
  List<Events> eventArray = [];

  // Insert Functions Here

  void _toggleEvent() {
    setState(() {
      if (_displayAddEvent == false) {
        _displayAddEvent = true;
      } else if (_displayAddEvent == true) {
        _displayAddEvent = false;
      }
    });
  }

  void _createEvents() {
    eventArray.add(_event);
    print(eventArray.length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Events Page'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    'Add An Event',
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: 'Fun in the Sun', labelText: 'Event Name'),
                    onChanged: (String value) {
                      _event.name = value;
                    },
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: 'Boulder', labelText: 'Where is it?'),
                    onChanged: (String value) {
                      _event.location = value;
                    },
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: 'Who, what, when, where, and why',
                        labelText: 'Add a Description'),
                    onChanged: (String value) {
                      _event.description = value;
                    },
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: new Text('Submit Event'),
                    onPressed: () {
                      _createEvents();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
