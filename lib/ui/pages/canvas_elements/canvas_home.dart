//import 'package:copy_cat/ui/pages/model_details.dart';
import 'package:copy_cat/ui/pages/canvas_elements/model_details.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/models/db_manager.dart';

class CanvasHome extends StatefulWidget {
  @override
  _CanvasHomeState createState() => _CanvasHomeState();
}

class _CanvasHomeState extends State<CanvasHome> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: FutureBuilder(
      future: DBManagerModel.getList(),
        builder: (context, snapshot) {
          final notes = snapshot.data;
          
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                String modelTitle = notes[index]['ModelTitle'];
                
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
                                    ModelTitle(notes[index]['ModelTitle']),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      ModelDescription(notes[index]['ModelDescription']),
                                      // Text(description)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FlatButton(
                                        color: Colors.white,
                                        child: Text("MODEL DETAILS", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
                                                          
                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("EDIT MODEL", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(modelTitle, notes[index]['id'])));
                                      },
                                    ),
                                    IconButton(
                                       icon: Icon(Icons.delete),
                                       onPressed: (){
                                         DBManagerModel.deleteModel(notes[index]['id']);
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



class ModelTitle extends StatelessWidget {
  final String _title;

  ModelTitle(this._title);

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

class ModelDescription extends StatelessWidget {
 final String description;

  ModelDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextStyle(color: Colors.grey.shade600), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}




