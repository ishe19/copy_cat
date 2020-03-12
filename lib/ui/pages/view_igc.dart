import 'package:flutter/material.dart';
import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/models/db2.dart';
import 'package:flutter/services.dart';

import 'igc.dart' as igc;


enum NoteMode { 
  Editing,
  Adding
}

final formkey = new GlobalKey<FormState> ();


class ViewIGC extends StatefulWidget {
  final String postName;
  final String question;



  ViewIGC(this.postName, this.question);

  @override
  _ViewIGCState createState() => _ViewIGCState();
}

class _ViewIGCState extends State<ViewIGC> {

  returnFunction(String name){
    if(widget.postName == "Challenges"){
      return DBManagerGuide.getListChall2();
    }else if(widget.postName == "Solutions"){
      return DBManagerGuide.getListSol();
    } else if(widget.postName == "Impact Gap"){
      return DBManagerGuide.getListImp();
    }
  }

  returnPageFunction(String name, String question) {
    if(widget.postName == "Challenges"){
      return igc.ChallengeNote(igc.NoteMode.Adding, null, question);
    }else if(widget.postName == "Solutions"){
      return igc.SolutionNote(igc.NoteMode.Adding, null, question);
    } else if(widget.postName == "Impact Gap"){
      return igc.ImpactNote(igc.NoteMode.Adding, null, question);
    }
  }

  Future rotatePage() async {
	
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
	
  }

  bool loaded = false;


  @override
  void initState(){
    super.initState();
    rotatePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postName),       
      ),
      // body: futureTest(),
      body: loaded == false? Center(child: CircularProgressIndicator(),)
      : futureTest(),
    );
  }


  Widget futureTest() {
    return FutureBuilder(
      future: returnFunction(widget.postName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            loaded = true;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //TODO SUPPOSED TO HAVE AN EDITING FUNCTION WILL DO THAT SOON LOL
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => returnPageFunction(widget.postName, widget.question)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _NoteTitle(notes[index]['question']),
                          SizedBox(
                            height: 20.0,
                          ),
                          _NoteDescription(notes[index]['title']),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: Container(child:LinearProgressIndicator()));
        },
      );
  }

  

  

  

}




class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class _NoteDescription extends StatelessWidget {
  String description;

  _NoteDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text("Answer: " + description, style: TextStyle(color: Colors.grey.shade600), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}





class CanvasNote extends StatefulWidget {

  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String parentPageName;

  CanvasNote(this.noteMode, this.note, this.parentPageName);

  @override
  CanvasNoteState createState() {
    return new CanvasNoteState();
  }
}

class CanvasNoteState extends State<CanvasNote> {

  String title;
  String noteDescription;
  String testId;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final form = formkey.currentState;



  bool validateForm() {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      return true;

    }else{
      return false;
    }
  }
  

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      setState(() {
        title = _titleController.text;
      });
    });


    _descriptionController.addListener(() {
      setState(() {
        noteDescription = _descriptionController.text;
      });
    });

  }
  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _descriptionController.text = widget.note['description'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formkey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Model Id: " + testId),
            TextFormField(
              controller: _titleController,
              onSaved: (value) => title = value,
              validator: (val) =>  val.length == 0? "Please enter title" : null,
              decoration: InputDecoration(
                hintText: 'Note title'
              ),
            ),
            Container(height: 8,),
            TextFormField(
              validator: (val) =>  val.length == 0? "Please enter description" : null,
              onSaved: (value) => noteDescription = value,
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Note description'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  if(validateForm()) {
                    print("Testing $testId");
                      if (widget?.noteMode == NoteMode.Adding) {
                        DBManagerViews.insertCustSegNote({
                          'title': title,
                          'description': noteDescription,
                          'modelID': testId,
                        }, widget.parentPageName);
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManagerViews.updateCustSegNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        }, widget.parentPageName);
                        
                    }
                  Navigator.pop(context);
                  }
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await DBManagerViews.deleteNote(widget.note['id'], widget.parentPageName);
                      Navigator.pop(context);
                    }),
                  )
                 : Container()
              ],
            )
          ],
        ),
        )
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {

  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      height: 40,
      minWidth: 100,
      color: _color,
    );
  }
}




