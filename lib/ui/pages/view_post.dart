import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';

class ViewPost extends StatefulWidget {
  final String postName;
  ViewPost(this.postName);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {

  TextEditingController controller;
  TextEditingController _editController = new TextEditingController();

  String edit;
  List items = [
    "Hello",
    "World"
  ];


  
  @override
  void initState(){
    super.initState();
    _editController.addListener((){
      setState(() {
        edit = _editController.text;
      });
    });
  }

  void upDateList(int index, String editedPost){
    setState(() {
      items.removeAt(index);
      items.replaceRange(index, index, ["$editedPost, $index"]);
      print(items);
    });
  }

  void newPost(String post){

    setState(() {
      items.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          newPost("post");
        },
        backgroundColor: Uidata.btnColor,
        child: Icon(Icons.add),
      ),
      body: Container(
          child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index){
                        return viewCard(items[index], index);
                      }),
        )
    );
  }

  Widget viewCard(String post, int index){

    FocusNode _focusNode = new FocusNode();
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
                        Text(post, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 240,
                          child: EditableText(
                            controller: _editController,
                            focusNode: _focusNode,
                            style: TextStyle(color:  Colors.black),
                            cursorColor: Colors.black,
                            backgroundCursorColor: Colors.white,
                            forceLine: true,
//                            onSubmitted: ,

                          )
                        )
                      ],

                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          //                splashColor: Colors.grey,
                          color: Colors.white,
                          child: Text("EDIT POST", style: TextStyle(color: Uidata.primaryColor),),
                          onPressed: (){
//                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPost()));
                          upDateList(index, edit);
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

class EditPost extends StatefulWidget {
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}