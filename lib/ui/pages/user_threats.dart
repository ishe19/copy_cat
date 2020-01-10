import 'package:flutter/material.dart';

class Threat extends StatefulWidget{
  Threat({this.title, this.strengths});
  final Widget title, strengths;
  @override
  ThreatState createState() => new ThreatState();
}

class ThreatState extends State<Threat>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar(
          title: Text('Threats'),
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

            },
          ),]),
        body: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration.collapsed(
                hintText: "Add your threats..."
              ),

            )
          ],
        )
    );
  }
}