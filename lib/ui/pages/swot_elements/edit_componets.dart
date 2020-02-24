
import 'package:copy_cat/ui/pages/swot_elements/final_table.dart';
import 'package:copy_cat/ui/pages/swot_elements/opportunities_elements/opp_list.dart';
import 'package:copy_cat/ui/pages/swot_elements/strengths_elements/views/strengths_list.dart';
import 'package:copy_cat/ui/pages/swot_elements/threats_elements/threats_list.dart';
import 'package:copy_cat/ui/pages/swot_elements/weakness_elements/w_views/weak_list.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SwotGrid extends StatelessWidget{
  final int swotID;

  SwotGrid(this.swotID);
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('SWOT ANALYSIS'),
        actions: <Widget>[
          
        ],
      ),
            floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => TableWidget(swotID)));
        },
        child: Icon(Icons.exit_to_app),
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
                         Navigator.push(context, MaterialPageRoute(builder: (context) => NoteList(swotID.toString())));
                       },
                       
                       child:Column(
                         children: <Widget>[
                           Text('Strengths',
                           style: TextStyle(
                             fontSize: 25
                           ),),
                 ]),),),),
          Card(
            elevation: 5.0,
            color: Colors.yellow,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.yellowAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => WeakList(swotID.toString())));
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Weaknesses',
                           style: TextStyle(
                             fontSize: 25
                           ),),

                 ]),),),),
          Card(
            elevation: 5.0,
            color: Colors.blue,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.blueAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => OppsList(swotID.toString())));
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Opportunities',
                           style: TextStyle(
                             fontSize: 25                           ),),

                 ]),),),),         
          Card(
            elevation: 5.0,
            color: Colors.purple,
            child: Container(
              
          child:
               InkWell(splashColor: Colors.purpleAccent,
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ThreatList(swotID.toString())));
               },
               
               child:Column(
                 children: <Widget>[
                   Text('Threats',
                           style: TextStyle(
                             fontSize: 25
                           ),),

                 ]),),),),
               ],
      );
      },
      ),
      );
      }
  }

 