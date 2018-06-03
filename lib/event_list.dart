import 'package:flutter/material.dart';
import 'events.dart';

class Events {
  String name;
  String location;
  String description;

  Events({this.name, this.location, this.description});
}

class EventList extends StatefulWidget {
  EventList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventList createState() => new _EventList();
}

class _EventList extends State<EventList> {
Events _event = new Events();
List<Events> eventArray = []; // Hosts the events coming back and the ones created

//   final _mockEvents = const <Events>[
//     const Events(
//      name: 'Bouldering',
//      location: 'Boulder, CO',
//       description: 'Going Bouldering in the flatirons'
//    ),
//    const Events(
//      name: 'Running',
//      location: 'Aspen, CO',
//      description: 'Ultra run for shits and gigs'
//    )
//  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Events List'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new ListView.builder(
        itemCount: 10,
        itemExtent: 150.0,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.event),
                  title: const Text('Card Title'),
                  subtitle: const Text('This is card at index'),
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        child: new Text('I\'m Going'),
                        onPressed: (){
                          print("You're attending this event");
                        },
                      ),
                      new RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        child: new Text('More Info'),
                        onPressed: (){
                          print("Getting More Info");
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.add),
        onPressed: () {
          //_toggleEvent();
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new EventsPage()));
        },
      ),
    );
  }
}
