import 'package:copy_cat/models/db2.dart';
import 'package:flutter/material.dart';

enum NoteMode { Editing, Adding }

class IgcAnswers extends StatefulWidget {
  final String question;
  final int modelId;
  final String title;

  IgcAnswers(this.question, this.modelId, this.title);
  @override
  IgcAnswersState createState() {
    return new IgcAnswersState();
  }
}

class IgcAnswersState extends State<IgcAnswers> {
  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          FutureBuilder(
            future: DBManagerGuide1.getLists(widget.question, widget.modelId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final notes = snapshot.data;
                print(notes);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IgcEditing(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.question)));
                        },
                        child: Card(
                          child: new Container(
                              child: new Center(
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            _NoteTitle(
                                              notes[index]['answer'],
                                            ),

                                            // set some style to text

                                            // set some style to text
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: const Color(0xFF167F67),
                                            ),
                                            onPressed: () {
                                            }),
                                        new IconButton(
                                            icon: const Icon(
                                                Icons.delete_forever),
                                               onPressed: () {

                                               }
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0)),
                        ));
                  },
                  itemCount: notes == null ? 0 : notes.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
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




class IgcEditing extends StatefulWidget {
  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String answerName;

  IgcEditing(this.noteMode, this.note, this.answerName);

  @override
  IgcEditingState createState() {
    return IgcEditingState();
  }
}

class IgcEditingState extends State<IgcEditing> {
  final TextEditingController _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _textController.text = widget.note['answer'];
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    print(widget.note['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noteMode == NoteMode.Adding
            ? 'Add Response'
            : 'Edit Response'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: 'Your answer'),
            ),
            Container(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final answer = _textController.text;
                  print(widget.note['id']);
                  DBManagerGuide1.updateCustSegNote(
                      {'id': widget.note['id'], 'answer': answer},
                      widget.answerName);
                  Navigator.pop(context);
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
                          await DBManagerGuide1.deleteNote(
                              widget.note['id'], widget.answerName);
                          Navigator.pop(context);
                        }),
                      )
                    : Container()
              ],
            )
          ],
        ),
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

class Igc1Answers extends StatefulWidget {
  final String question;
  final int modelId;
  final String title;

  Igc1Answers(this.question, this.modelId, this.title);
  @override
  Igc1AnswersState createState() {
    return new Igc1AnswersState();
  }
}

class Igc1AnswersState extends State<Igc1Answers> {
  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          FutureBuilder(
            future: DBManagerGuide1.getLists(widget.question, widget.modelId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final notes = snapshot.data;
                print(notes);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IgcEditing(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.question)));
                        },
                        child: Card(
                          child: new Container(
                              child: new Center(
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            _NoteTitle(
                                              notes[index]['answer'],
                                            ),

                                            // set some style to text

                                            // set some style to text
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: const Color(0xFF167F67),
                                            ),
                                            onPressed: () {
                                            }),
                                        new IconButton(
                                            icon: const Icon(
                                                Icons.delete_forever),
                                               onPressed: () {

                                               }
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0)),
                        ));
                  },
                  itemCount: notes == null ? 0 : notes.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class Igc2Answers extends StatefulWidget {
  final String question;
  final int modelId;
  final String title;

  Igc2Answers(this.question, this.modelId, this.title);
  @override
  Igc2AnswersState createState() {
    return new Igc2AnswersState();
  }
}

class Igc2AnswersState extends State<Igc2Answers> {
  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          FutureBuilder(
            future: DBManagerGuide1.getLists(widget.question, widget.modelId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final notes = snapshot.data;
                print(notes);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IgcEditing(
                                      NoteMode.Editing,
                                      notes[index],
                                      widget.question)));
                        },
                        child: Card(
                          child: new Container(
                              child: new Center(
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            _NoteTitle(
                                              notes[index]['answer'],
                                            ),

                                            // set some style to text

                                            // set some style to text
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: const Color(0xFF167F67),
                                            ),
                                            onPressed: () {
                                            }),
                                        new IconButton(
                                            icon: const Icon(
                                                Icons.delete_forever),
                                               onPressed: () {

                                               }
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 0.0, 0.0)),
                        ));
                  },
                  itemCount: notes == null ? 0 : notes.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

