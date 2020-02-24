

import 'package:copy_cat/ui/pages/swot_elements/edit_componets.dart';
import 'package:copy_cat/ui/pages/swot_elements/swot_details.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/models/db_manager.dart';

class SWOTHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(10),
        child:FutureBuilder(
       future: DBManagerSwot.getList(),
        builder: (context, snapshot) {
          final notes = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                      padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SwotTitle(notes[index]['SwotTitle']),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SwotDescription(notes[index]['SwotDescription']),
                                      // Text(description)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FlatButton(
                                        //                splashColor: Colors.grey,
                                        color: Colors.white,
                                        child: Text("EDIT COMPONENTS", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => SwotGrid(notes[index]['id'])));
                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("DETAILS", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                     IconButton(
                                       icon: Icon(Icons.delete),
                                       onPressed: (){
                                         DBManagerSwot.deleteModel(notes[index]['id']);
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
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }


}




class SwotTitle extends StatelessWidget {
  final String _title;

  SwotTitle(this._title);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class SwotDescription extends StatelessWidget {
  String description;

  SwotDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextStyle(color: Colors.grey.shade600), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

