import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/canvas_elements/canvas_model.dart';
import 'package:copy_cat/ui/pages/canvas_elements/view_post.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:copy_cat/models/db2.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ModelDetails extends StatefulWidget {
  final int modelId;
  final String modelTitle;

  ModelDetails(this.modelTitle, this.modelId);

  @override
  _ModelDetailsState createState() => _ModelDetailsState();
}

class _ModelDetailsState extends State<ModelDetails> {
//  double height = MediaQuery.of(context).size.height;

  TextEditingController customController = new TextEditingController();
  String testAnswer;

  @override
  void initState() {
    super.initState();
    DBManagerViews.openDB();
    DBManagerGuide1.openDB();
  }

  var items = [
    "Customer Segments",
    "Value Propositions",
    "Channels",
    "Customer Relationships",
    "Revenue Stream",
    "Key Resources",
    "Key Activities",
    "Key Partners",
    "Cost Structure"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Business model for: " + widget.modelTitle),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.black, Colors.blue])),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.input),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CanvasModelR(widget.modelId)));
                }),
          ], 
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.blue, Colors.black])),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
//            defaultColumnWidth: FractionColumnWidth(0.32),
                    children: [
                      TableRow(children: [
                        cardView("Customer Segments",
                            Icon(Icons.bluetooth_searching)),
                        cardView("Value Propositions", Icon(Icons.view_array)),
                        cardView("Channels", Icon(Icons.view_array)),
                      ]),
                      TableRow(children: [
                        cardView(
                            "Customer Relationships", Icon(Icons.view_array)),
                        cardView("Revenue Streams", Icon(Icons.view_array)),
                        cardView("Key Resources", Icon(Icons.view_array)),
                      ]),
                      TableRow(children: [
                        cardView("Key Activities", Icon(Icons.view_array)),
                        cardView("Key Partners", Icon(Icons.view_array)),
                        cardView("Cost Structure", Icon(Icons.view_array)),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget cardView(String cardName, Icon icon) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewPost(cardName, widget.modelId)));
        },
        child: Container(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
              Text(
                "$cardName",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
             Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  //                splashColor: Colors.grey,
                  color: Colors.black,
                  onPressed: () {
                    return Alert(
                        context: context,
                        title:  cardName + ":",
                        content: TextField(
                          controller: customController,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text('Done'),
                            onPressed: () {
                              Navigator.pop(context);
                              final answer = customController.text;
                              print(answer);
                              DBManagerViews.insertCustSegNote({
                               'title': answer,
                               'modelID': widget.modelId,
                              }, cardName);
                              customController.clear();
                            },
                          )
                        ]).show();
                  },
                ),              
                   IconButton(
                    icon: Icon(Icons.visibility,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPost(cardName, widget.modelId)));
                  },
                )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}

enum NoteMode { Editing, Adding }

class IGC extends StatefulWidget {
  @override
  IGCState createState() => IGCState();
}

class IGCState extends State<IGC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: SideDrawer(),

      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("IGC"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: () {
          // Navigator.push(
          //context,
          //  MaterialPageRoute(
          //     builder: (context) =>
          // subject.CustomerDetails(subject.NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: DBManagerCustomer.getSubjectList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: Card(
                    color: Colors.grey.shade200,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5.0, left: 15.0),
                                          child: CustomerTitle(
                                              notes[index]['SubjectTitle']),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        FlatButton(
                                          color: Colors.white,
                                          child: Text(
                                            "Customer details",
                                            style: TextStyle(
                                                color: Uidata.primaryColor),
                                          ),
                                          onPressed: () {
                                            //    Navigator.push(
                                            //      context,
                                            //       MaterialPageRoute(
                                            //          builder: (context) =>
                                            //  CustomerElements(
                                            //                notes[index]
                                            //                    ['id'])));
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.white,
                                          child: Text(
                                            "EDIT Customer",
                                            style: TextStyle(
                                                color: Uidata.primaryColor),
                                          ),
                                          onPressed: () {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(modelTitle, notes[index]['id'])));
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            DBManagerCustomer.deleteSubject(
                                                notes[index]['id']);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))),
                  ),
                );
              },
              itemCount: notes == null ? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CustomerTitle extends StatelessWidget {
  final String _title;

  CustomerTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class ModelDescription extends StatelessWidget {
 final String description;

  ModelDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(color: Colors.grey.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}




        







