import 'package:flutter/material.dart';
import 'package:copy_cat/models/db_manager.dart';

final formkey = new GlobalKey<FormState>();

class ViewPost extends StatefulWidget {
  final String postName;
  final int modelId;
  ViewPost(this.postName, this.modelId);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  void initState() {
    super.initState();
    print(widget.postName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postName),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.black])),
          ),
          SafeArea(
            child: FutureBuilder(
              future: DBManagerViews.getLists(widget.postName, widget.modelId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final notes = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CanvasNote(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.postName,
                                      widget.modelId)));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _NoteTitle(notes[index]['title']),
                                Container(
                                  height: 4,
                                ),
                              ],
                            ),
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
          ),
        ],
      ),
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
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

enum NoteMode { Editing, Adding }

class CanvasNote extends StatefulWidget {
  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String parentPageName;
  final int modelId;

  CanvasNote(this.noteMode, this.note, this.parentPageName, this.modelId);

  @override
  CanvasNoteState createState() {
    return new CanvasNoteState();
  }
}

class CanvasNoteState extends State<CanvasNote> {
  String title;
  String testId;

  TextEditingController _titleController = TextEditingController();

  final form = formkey.currentState;

  bool validateForm() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      return true;
    } else {
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

    testId = widget.modelId.toString();
  }

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Answer'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
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
                  validator: (val) =>
                      val.length == 0 ? "Please enter title" : null,
                  decoration: InputDecoration(hintText: 'answer'),
                ),
                Container(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _NoteButton('Save', Colors.blue, () {
                      if (validateForm()) {
                        print("Testing $testId");
                        if (widget?.noteMode == NoteMode.Adding) {
                          DBManagerViews.insertCustSegNote({
                            'title': title,
                            'modelID': testId,
                          }, widget.parentPageName);
                        } else if (widget?.noteMode == NoteMode.Editing) {
                          DBManagerViews.updateCustSegNote({
                            'id': widget.note['id'],
                            'title': _titleController.text,
                          }, widget.parentPageName);
                        }
                        print("$title" + widget.modelId.toString());
                        Navigator.pop(context);
                      }
                    }),
                    Container(
                      height: 16.0,
                    ),
                    _NoteButton('Discard', Colors.grey, () {
                      Navigator.pop(context);
                    }),
                    widget.noteMode == NoteMode.Editing
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: _NoteButton('Delete', Colors.red, () async {
                              await DBManagerViews.deleteNote(
                                  widget.note['id'], widget.parentPageName);
                              Navigator.pop(context);
                            }),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          )),
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
