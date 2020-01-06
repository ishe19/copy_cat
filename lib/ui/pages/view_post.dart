import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  String postName;
  ViewPost(this.postName);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postName),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.pages),
                Text("Add post")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
