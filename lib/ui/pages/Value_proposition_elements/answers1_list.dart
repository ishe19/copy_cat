import 'package:copy_cat/ui/pages/Value_proposition_elements/value_proposition.dart';
import 'package:copy_cat/models/db2.dart';
import 'package:flutter/material.dart';

class Answer1List extends StatefulWidget {
  final String question;
  final int modelId;

  Answer1List(this.question, this.modelId);
  @override
  NoteListState createState() {
    return new NoteListState();
  }
}

class NoteListState extends State<Answer1List> {
  var list = [
    "What is the customer category?",
    "What are the current negative/undesirable Experiences",
    "What are the concerns about the current solutions",
    "Unmet needs",
    "What are the Competing products?",
    "How does the competing product performance compare?"
  ];

  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Category'),
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
            future: DBManagerAnswers.getLists(widget.question, widget.modelId),
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
                                    builder: (context) => Answers1(
                                        NoteMode.Editing,
                                        notes[index],
                                        widget.question)));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              _NoteTitle(notes[index]['answer']),
                              Container(
                                height: 4,
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Answers1(
                                                  NoteMode.Editing,
                                                  notes[index],
                                                  widget.question)));
                                },
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


class QueAnswer1List extends StatefulWidget {
  final String question;
  final int modelId;

  QueAnswer1List(this.question, this.modelId);
  @override
  QueNoteListState createState() {
    return new QueNoteListState();
  }
}

class QueNoteListState extends State<QueAnswer1List> {
  var list = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six"
  ];

  @override
  void initState() {
    super.initState();
    print(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Category'),
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
            future: DBManagerQueAnswers.getLists(widget.question, widget.modelId),
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
                                    builder: (context) => QueAnswers1(
                                        NoteMode.Editing,
                                        notes[index],
                                        widget.question)));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              _NoteTitle(notes[index]['answer']),
                              Container(
                                height: 4,
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => QueAnswers1(
                                                  NoteMode.Editing,
                                                  notes[index],
                                                  widget.question)));
                                },
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
        ],
      ),
    );
  }
}