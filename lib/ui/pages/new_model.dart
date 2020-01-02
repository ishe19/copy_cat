import 'package:copy_cat/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';


final formkey = new GlobalKey<FormState> ();

class NewModel extends StatefulWidget {
  @override
  _NewModelState createState() => _NewModelState();
}

class _NewModelState extends State<NewModel> {

  TextEditingController _titleController;
  Color labelColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
        title: Text("New Model"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

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
                indicatorColor: Colors.black,
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
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        onTap: changeColor,
                        controller: _titleController,
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
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.green),
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
                      child: TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.green),
                          labelText: "For",
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
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.green),
                          labelText: "By",
                        ),
                        keyboardType: TextInputType.text,
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

  void changeColor(){
    setState(() {
      labelColor = Colors.green;
    });
  }

}
