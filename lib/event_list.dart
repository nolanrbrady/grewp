import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:convert/convert.dart';
import 'dart:convert';
import 'events.dart';

// Events from Eventful for the Flat list
class Event {
  final String url;
  final String cityName;
  final String description;
  final String title;
  final String thumbNail;
  final String image;

  Event({
    this.url,
    this.cityName,
    this.description,
    this.title,
    this.thumbNail,
    this.image
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return new Event(
      url: json['url'],
      cityName: json['city_name'],
      description: json['description'],
      title: json['title'],
      thumbNail: json['image.thumb'],
      image: json['image.medium']
    );
  }
}

class EventList extends StatefulWidget {
  EventList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EventList createState() => new _EventList();
}

class _EventList extends State<EventList> {

  List data;
  Map listData;

@override
void initState(){
    _fetchEvents();
  }


// API call to Eventful
Future<Event> _fetchEvents() async {
  final response = await http.get('http://api.eventful.com/json/events/search?...&where=boulder&app_key=KvcFJJmZhDw8CZJw');
  this.setState((){
    listData = JSON.decode(response.body);
    data = listData['events']['event'];
  });
   print(data);
  return new Event.fromJson(listData);
}

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
        itemCount: data == null ? 0 : data.length, 
        itemExtent: 150.0,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.event),
                  title: new Text(data[index]['title']),
                  subtitle: const Text("Testing the thing"),
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
          print(data[2]['title']);
          print(data.length);
          print(data[2]['city_name']);
          print(data[2]['description']);
          //_toggleEvent();
          // Navigator.push(context,
          //     new MaterialPageRoute(builder: (context) => new EventsPage()));
        },
      ),
    );
  }
}
