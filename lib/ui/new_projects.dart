import 'package:copy_cat/models/db_manager.dart';
import 'package:flutter/material.dart';

import 'utils/uidata.dart';

enum NoteMode { 
  Editing,
  Adding
}



final formkey = new GlobalKey<FormState> ();

class NewProject extends StatefulWidget {

  final Map<String, dynamic> note;
  final NoteMode noteMode;

  // final cameras;
  NewProject(this.note, this.noteMode);


  @override
  NewProjectState createState() => NewProjectState();
}

class NewProjectState extends State<NewProject> {

  String modelTitle;
  String modelDescription;

  final form = formkey.currentState;


  TextEditingController _modelTitleController = new TextEditingController();
  TextEditingController _modelDescriptionController = new TextEditingController();

  Color labelColor = Colors.grey;
  
  


  @override
  void initState(){
    super.initState();
    _modelDescriptionController.addListener(
      (){
        setState(() {
          modelDescription = _modelDescriptionController.text;
        });
      }
    );
    _modelTitleController.addListener(
      (){
        setState(() {
          modelTitle = _modelTitleController.text;
        });
      }
    );

  }

  bool validateForm() {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      return true;

    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage()));
          },
        ),
        title: Text("New Project"),
         flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.black,
              Colors.blue
            ])
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if(validateForm()) {
                      if (widget.noteMode == NoteMode.Adding) {
                        DBManagerProjects.insertItem({
                          'ModelTitle': modelTitle,
                          'ModelDescription': modelDescription,
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManagerProjects.updateItem({
                          'id': widget.note['id'],
                          'ModelTitle': _modelTitleController.text,
                          'ModelDescription': _modelDescriptionController.text,
                       });
                    }
                    print("$modelTitle, $modelDescription,");
                  Navigator.pop(context);
                  }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formkey,
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                indicatorColor: Colors.green,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Uidata.primaryColor, fontSize: 20.0
                  )
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        indicatorColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        onTap: (){

                        },
                        controller: _modelTitleController,
                        onSaved: (value) => modelTitle = value,
                        validator: (val) =>  val.length == 0? "Please enter title" : null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: labelColor),
                          labelText: "Title",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        controller: _modelDescriptionController,
                        onSaved: (value) => modelDescription = value,
                        validator: (val) =>  val.length == 0? "Please enter description" : null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: labelColor),
                          labelText: "Description",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                    
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              splashColor: Color.fromRGBO(211, 211, 211, 0.8),
                              onPressed: (){
                              },
                              child: Icon(Icons.folder_open, color: Colors.grey, size: 50.0,),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                                color: Colors.white,
                              splashColor: Color.fromRGBO(211, 211, 211, 0.8),
                                child: Icon(Icons.camera_alt, color: Colors.grey, size: 50.0,),
                                onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                                },
                              ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
