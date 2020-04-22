import 'package:copy_cat/ui/utils/pdf_generator.dart';
import 'package:copy_cat/ui/utils/plan_tools.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';

class ProjectDash extends StatefulWidget {
  final int modelId;
  final String title;
  ProjectDash(this.title,this.modelId);

  @override
  _ProjectDashState createState() => _ProjectDashState();
}

class _ProjectDashState extends State<ProjectDash> {


  @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
        actions: [
          IconButton(icon: Icon(Icons.picture_as_pdf,
          color: Colors.white),
           onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyPdfHomePage())); 
           }
       ),
       IconButton(icon: Icon(Icons.picture_as_pdf,
          color: Colors.black),
           onPressed: () {
           }
       )
        ]
      ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.blue, Colors.black])),
      ),
      SafeArea(
          child: ListView(
        children: <Widget>[
          Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("PLAN",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              )],
            ),
            Row(
              children: <Widget>[
                // SwotDescription(notes[index]['SwotDescription']),
                // Text(description)
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  //                splashColor: Colors.grey,
                  color: Colors.white,
                  child: Text(
                    "Open",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlanDash(widget.title,widget.modelId)));
                    
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    "",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                   
                  },
                )
              ],
            )
          ],
        ),
      ),
    )
    ),
    Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("DO",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              )],
            ),
            Row(
              children: <Widget>[
                // SwotDescription(notes[index]['SwotDescription']),
                // Text(description)
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  //                splashColor: Colors.grey,
                  color: Colors.white,
                  child: Text(
                    "Open",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {

                  },
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    "",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                   
                  },
                )
              ],
            )
          ],
        ),
      ),
    )
    ),
    Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("CHECK",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              )],
            ),
            Row(
              children: <Widget>[
                // SwotDescription(notes[index]['SwotDescription']),
                // Text(description)
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  //                splashColor: Colors.grey,
                  color: Colors.white,
                  child: Text(
                    "Open",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                                                                               
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    "",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                   
                  },
                )
              ],
            )
          ],
        ),
      ),
    )
    ),
    Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("ADAPT",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              )],
            ),
            Row(
              children: <Widget>[
                // SwotDescription(notes[index]['SwotDescription']),
                // Text(description)
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  //                splashColor: Colors.grey,
                  color: Colors.white,
                  child: Text(
                    "Open",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                    
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    "",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                   
                  },
                )
              ],
            )
          ],
        ),
      ),
    )
    ),
         
        ],
      ))
    ]));
  }
}