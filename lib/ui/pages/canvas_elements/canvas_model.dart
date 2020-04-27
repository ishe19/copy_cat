import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:copy_cat/ui/pages/Value_proposition_elements/vp_summary.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:copy_cat/models/db_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:toast/toast.dart';

class CanvasModelR extends StatefulWidget {
  final int modelID;

  CanvasModelR(this.modelID);
  @override
  _CanvasModelRState createState() => _CanvasModelRState();
}

class _CanvasModelRState extends State<CanvasModelR> {
  // static GlobalKey previewContainer = new GlobalKey();
  static GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Preview"), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: TakeScreenShot2,
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
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("The Business Model Canvas",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline))
                            ],
                          ),
                          Card(
                            child: Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(children: [
                                  Text("Customer Segments",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                  Text("Value Propositions",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                  Text("Channels",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                ]),
                                TableRow(children: [
                                  Container(
                                    color: Colors.white,
                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Customer Segments", widget.modelID),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Value Propositions", widget.modelID),
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
                                                  color: Colors.yellow,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,

                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Channels", widget.modelID),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Text("Customer Relationships",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                  Text("Revenue Streams",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                  Text("Key Resources",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                ]),
                                TableRow(children: [
                                  Container(
                                    color: Colors.white,
                                    height: 150,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Revenue Streams", widget.modelID),
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
                                                  color: Colors.green,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 150,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Text("Key Activities",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                  Text("Key Partners",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                  Text("Cost Structure",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.underline)),
                                ]),
                                TableRow(children: [
                                  Container(
                                    color: Colors.white,
                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Key Activities", widget.modelID),
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
                                                  color: Colors.tealAccent,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Key Partners", widget.modelID),
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
                                                  color: Colors.amber,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 150,
                                    // width: ,
                                    child: FutureBuilder(
                                      future: DBManagerViews.getLists(
                                          "Cost Structure", widget.modelID),
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
                                                  color: Colors.blueGrey,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CanvasTitle(notes[index]
                                                          ['title']),
                                                      Container(
                                                        height: 4,
                                                      ),
                                                      // _NoteDescription(notes[index]['description'])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: notes == null
                                                ? 0
                                                : notes.length,
                                          );
                                        }
                                        return Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))));
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
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
      await file.writeAsBytes(pngBytes);
      print(file.path);
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  Future<Uint8List> TakeScreenShot2() async {
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
      Toast.show("file saved in : $filePath", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      // print(pngBytes);
      // print(bs64);
      // setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
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
