import 'package:copy_cat/ui/pages/Value_proposition_elements/value_proposition.dart';
import 'package:copy_cat/ui/pages/canvas_elements/model_details.dart';
import 'package:copy_cat/ui/pages/impact_gap_canvas/starting_page.dart';
import 'package:copy_cat/ui/pages/swot_elements/edit_componets.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';

class PlanDash extends StatefulWidget {
  final int modelId;
  final String title;
  PlanDash(this.title,this.modelId);

  @override
  _PlanDashState createState() => _PlanDashState();
}

class _PlanDashState extends State<PlanDash> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Planning for: " + widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
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
              children: <Widget>[Text("Impact Gap Canvas",
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
                    "EDIT",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>IGCElements(widget.title,widget.modelId)));          

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
              children: <Widget>[Text("Value Proposition Canvas",
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
                    "EDIT",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context) =>ValueDashboard(widget.title)));          
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
              children: <Widget>[Text("Business model canvas",
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
                    "EDIT",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(widget.title, widget.modelId)));
                    
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
              children: <Widget>[Text("SWOT Analysis",
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
                    "EDIT",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SwotGrid(widget.title,widget.modelId)));
                    
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