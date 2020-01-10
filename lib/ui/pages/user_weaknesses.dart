import 'package:flutter/material.dart';

class Weak extends StatefulWidget{
  Weak({this.title, this.strengths});
  final Widget title, strengths;
  @override
  WeakState createState() => new WeakState();
}

class WeakState extends State<Weak>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar( 
          title: Text('Weaknesses'),
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
                hintText: "Add your strengths..."
              ),
            )
          ],
        )
    );
  }
}