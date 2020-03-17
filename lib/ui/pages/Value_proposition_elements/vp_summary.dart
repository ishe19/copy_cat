import 'dart:convert';
import 'dart:typed_data';
import 'package:copy_cat/models/db2.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:ui' as ui;
import 'package:copy_cat/models/db_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VPSummary extends StatefulWidget {
  final int modelID;

  VPSummary(this.modelID);
  @override
  VPSummaryState createState() => VPSummaryState();
}

class VPSummaryState extends State<VPSummary> {
  static GlobalKey previewContainer = new GlobalKey();

//  Future rotatePage() async {

  //await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

  // }

  //  Future<bool> _onBackPressed() async {
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // return true;
  // }

  // @override
  // void initState(){
  //  super.initState();
  // rotatePage();
  // }

  @override
  Widget build(BuildContext context) {
    return //WillPopScope(
        // onWillPop: _onBackPressed,
        // child:
        Scaffold(
            appBar: AppBar(title: Text("Preview"), actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: TakeScreenShot,
              ),
            ]),
            body: RepaintBoundary(
                key: previewContainer,
                child: Container(
                    color: Colors.white,
                    child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Card(
                              child: Column(children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Value Proposition For: "+ "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline))
                              ],
                            ),
                            Card(
                                child:
                                    Table(border: TableBorder.all(), children: [
                              TableRow(children: [
                                Text("Customer Category",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                Text("Product",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ]),
                              TableRow(children: [
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerAnswers.getLists(
                                        "one", widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.lightBlueAccent,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['answer']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.white,

                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "two", widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.red,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Text("Unmet Needs",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                Text("Solutions to unmet needs",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ]),
                              TableRow(children: [
                                Container(
                                  color: Colors.white,
                                  height: 1100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Customer Relationships",
                                        widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.pink,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Key Resources", widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.grey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Text("Concerns about current solutions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                Text(
                                    "Response to concern about current solutions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ]),
                              TableRow(children: [
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Customer Relationships",
                                        widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.pink,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Key Resources", widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.grey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Text("Competing products",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                Text("Product Differentiator",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ]),
                              TableRow(children: [
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Customer Relationships",
                                        widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.pink,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Key Resources", widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.grey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Text("Competing Product performance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                Text("Evidence of product performance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ]),
                              TableRow(children: [
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Customer Relationships",
                                        widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.pink,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: 100,
                                  // width: ,
                                  child: FutureBuilder(
                                    future: DBManagerViews.getLists(
                                        "Key Resources", widget.modelID),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        final notes = snapshot.data;
                                        return ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                                              },
                                              child: Card(
                                                elevation: 5.0,
                                                color: Colors.grey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    CanvasTitle(
                                                        notes[index]['title']),
                                                    Container(
                                                      height: 4,
                                                    ),
                                                    // _NoteDescription(notes[index]['description'])
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount:
                                              notes == null ? 0 : notes.length,
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                              ]),
                            ]))
                            //)
                          ]))
                        ]))));
  }

  Future<Uint8List> TakeScreenShot() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          previewContainer.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);

      var filePath = await ImagePickerSaver.saveFile(
        fileData: byteData.buffer.asUint8List(),
      );
      print(filePath);
      // print(pngBytes);
      // print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }
}

class CanvasTitle extends StatelessWidget {
  final String _title;

  CanvasTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      // style: TextStyle(
      //   fontWeight: FontWeight.bold
      // ),
    );
  }
}

class CanvasModelP extends StatefulWidget {
  final int modelID;

  CanvasModelP(this.modelID);
  @override
  _CanvasModelPState createState() => _CanvasModelPState();
}

class _CanvasModelPState extends State<CanvasModelP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: FutureBuilder(
        future: DBManagerViews.getLists("Customer Segments", widget.modelID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasNote(NoteMode.Editing, notes[index], widget.postName, widget.modelId)));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CanvasTitle(notes[index]['title']),
                        Container(
                          height: 4,
                        ),
                        // _NoteDescription(notes[index]['description'])
                      ],
                    ),
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
