import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IGCTable extends StatefulWidget {

  @override
  _IGCTableState createState() => _IGCTableState();
}

class _IGCTableState extends State<IGCTable> {

      static GlobalKey previewContainer = new GlobalKey();


  String questionString = "Hello World";
  double fontSizeR = 10.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: TakeScreenShot,
          ),
        ],
      ),
      body: RepaintBoundary(
        key: previewContainer,
        child:SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Table(
                    border: TableBorder.all(),
                    children: [TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Challenge: " + " $questionString", style: TextStyle(fontWeight: FontWeight.bold),)
                        )
                      ]
                    )],
                  ),
                )
              ],),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              Text("Challenge Mapping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, )),
                              Text("Impact Gap", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, )),
                              Text("Solutions Mapping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, )),
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Impact: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Gaps within the Solutions: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Local: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Causes: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 52.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Gaps between challenges & solution: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Global: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 52.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Trends: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Unaddressed Obstacles: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("What works and what doesn't: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height:22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              
                            ]
                          ),
                          TableRow(
                            children: [
                              Container(
                                height: 120.0,
                                color: Colors.red,
                                // child: Column(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: <Widget>[
                                //     Text("Causes: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                //     SizedBox(
                                //       height: 52.0,
                                //     ),
                                //     Card(
                                //       child: Text("Testing Purposes"),
                                //     )
                                //   ],
                                // ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Key Lessons: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 120.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Future focus: ", style: TextStyle(fontWeight: FontWeight.bold) ),
                                    SizedBox(
                                      height: 22.0,
                                    ),
                                    Card(
                                      child: Text("Testing Purposes", style: TextStyle( fontSize: fontSizeR),),
                                    )
                                  ],
                                ),
                              ),
                              
                            ]
                          ),


                        ],
                      )
                    )
                  ],
                )
              )
            ],
          )
        ),
      ),
    ),
  );
  }
  Future<Uint8List> TakeScreenShot() async{
      try {
    print('inside');
      RenderRepaintBoundary boundary =
          previewContainer.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
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