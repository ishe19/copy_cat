import 'package:flutter/material.dart';

class IGCTable extends StatefulWidget {

  @override
  _IGCTableState createState() => _IGCTableState();
}

class _IGCTableState extends State<IGCTable> {

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
            onPressed: (){

            },
          )
        ],
      ),
      body: SingleChildScrollView(
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
      )
    );
  }
}