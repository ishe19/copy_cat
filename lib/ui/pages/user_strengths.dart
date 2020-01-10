import 'package:flutter/material.dart';

class Strengths extends StatefulWidget{
  Strengths({this.title, this.strengths});
  final Widget title, strengths;
  @override
  StrengthsState createState() => new StrengthsState();
}

class StrengthsState extends State<Strengths>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar( 
          title: Text ('Strengths'),
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

            },
          ),]),
        body: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration.collapsed(
                hintText: "*Add your strengths..."
              ),

            ),
             TextFormField(
              decoration: new InputDecoration.collapsed(
                hintText: "*"
              ),

            )
          ],
        )
    );
  }
}