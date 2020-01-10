import 'package:copy_cat/ui/pages/user_opportunities.dart';
import 'package:copy_cat/ui/pages/user_strengths.dart';
import 'package:copy_cat/ui/pages/user_threats.dart';
import 'package:copy_cat/ui/pages/user_weaknesses.dart';
import 'package:copy_cat/ui/swot_home.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../dashboard.dart';

class SwotGrid extends StatelessWidget{
  
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard())
            );
          },
        ),
        title: Text('SWOT ANALYSIS'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
              },
          )
        ],
      ),
      body: OrientationBuilder(builder: (context, orientaion){
        return GridView.count(     
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            elevation: 5.0,
            color: Colors.green,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.greenAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Strengths()));
               },
               
               child:Column(
                 children: <Widget>[
                   Expanded(
                     child:Text('Strengths'),
               ),
                 ]),),),),
          Card(
            elevation: 5.0,
            color: Colors.yellow,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.yellowAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Weak()));
               },
               
               child:Column(
                 children: <Widget>[
                   Expanded(
                     child:Text('Weaknesses'),
               ),
                 ]),),),),
          Card(
            elevation: 5.0,
            color: Colors.blue,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.blueAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Opps()));
               },
               
               child:Column(
                 children: <Widget>[
                   Expanded(
                     child:Text('Opportunities'),
               ),
                 ]),),),),         
          Card(
            elevation: 5.0,
            color: Colors.purple,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.purpleAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Threat()));
               },
               
               child:Column(
                 children: <Widget>[
                   Expanded(
                     child:Text('Threats'),
               ),
                 ]),),),),
               ],
      );
      },
      ),
      ),
      );
      }
  }
   

