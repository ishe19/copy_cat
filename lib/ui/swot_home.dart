import 'package:copy_cat/ui/pages/edit_componets.dart';
import 'package:copy_cat/ui/pages/swot_details.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';

class SWOTHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child:Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("SWOT Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Accompanied Canvas Model")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          //                splashColor: Colors.grey,
                          color: Colors.white,
                          child: Text("EDIT COMPONENTS", style: TextStyle(color: Uidata.primaryColor),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SwotGrid()));

                          },
                        ),
                        FlatButton(
                          color: Colors.white,
                          child: Text("DETAILS", style: TextStyle(color: Uidata.primaryColor),),
                          onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
        )
    );
  }


}

