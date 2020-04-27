import 'dart:io';
import 'dart:typed_data';
import 'package:copy_cat/providers/swot_provider.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:convert';

class SWOTSummary extends StatefulWidget {
  final int modelID;

  SWOTSummary(this.modelID);
  @override
  SWOTSummaryState createState() => SWOTSummaryState();
}

class SWOTSummaryState extends State<SWOTSummary> {
  static GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return //WillPopScope(
        // onWillPop: _onBackPressed,
        // child:
        Scaffold(
      appBar: AppBar(
          title: Text("SWOT ANALYSIS Preview "),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.black, Colors.blue])),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => TakeScreenShot2(),
            ),
            IconButton(
              icon: Icon(Icons.query_builder),
              onPressed: () {},
            ),
          ]),
      body: RepaintBoundary(
          key: previewContainer,
          child: Container(
              color: Colors.blue,
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Table(border: TableBorder.all(), children: [
                          TableRow(children: [
                            Text("Strengths",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                            Text("Weaknesses",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          ]),
                          TableRow(children: [
                            Container(
                              color: Colors.white,
                              height: 200,
                              // width: ,
                              child: FutureBuilder(
                                future: DBManagerSWOT.getLists(
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
                              height: 200,
                              // width: ,
                              child: FutureBuilder(
                                future: DBManagerSWOT.getLists(
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
                                            color: Colors.yellow,
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
                          ]),
                          TableRow(children: [
                            Text("Opportunities",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                            Text("Threats",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          ]),
                          TableRow(children: [
                            Container(
                              color: Colors.white,
                              height: 200,
                              // width: ,
                              child: FutureBuilder(
                                future: DBManagerSWOT.getLists(
                                    "three", widget.modelID),
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
                              height: 200,
                              // width: ,
                              child: FutureBuilder(
                                future: DBManagerSWOT.getLists(
                                    "four", widget.modelID),
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
                          ]),
                        ]),
                      )),
                    )
                  ]))),
    );
  }

  Future<void> _takeScreenShot() async {
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
