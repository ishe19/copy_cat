import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';

enum NoteMode { 
  Editing,
  Adding
}


final formkey = new GlobalKey<FormState> ();

class CustomerDetails extends StatefulWidget {

  final NoteMode noteMode;
  final Map<String, dynamic> note;

  CustomerDetails(this.noteMode, this.note);

  // final cameras;
  // Newswot(this.cameras);


  @override
  CustomerDetailsState createState() => CustomerDetailsState();
}

class CustomerDetailsState extends State<CustomerDetails> {

  String customerTitle;
  TextEditingController _customerTitleController = new TextEditingController();



  Color labelColor = Colors.grey;

  @override
  void initState(){
    super.initState();
    
    _customerTitleController.addListener(
      (){
        setState(() {
          customerTitle = _customerTitleController.text;
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
          },
        ),
        title: Text("New Customer "),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if(validateForm()) {
                      if (widget.noteMode == NoteMode.Adding) {
                        DBManagerCustomer.insertCustomer({
                          'customerTitle': customerTitle,
                        
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManagerCustomer.updateCustomer({
                          'id': widget.note['id'],
                          'customerTitle': _customerTitleController.text,
                          
                        });
                    }
                    print("$customerTitle");
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
                        controller: _customerTitleController,
                        onSaved: (value) => customerTitle = value,
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
                    
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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