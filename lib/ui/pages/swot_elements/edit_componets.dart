
import 'package:copy_cat/providers/swot_provider.dart';
import 'package:copy_cat/ui/pages/swot_elements/final_table.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum NoteMode { Editing, Adding }

class SwotGrid extends StatefulWidget {
  final int modelId;
  final String title;
  SwotGrid(this.title,this.modelId);

  @override
  SwotGridState createState() => SwotGridState();
}

class SwotGridState extends State<SwotGrid> {
  TextEditingController customController = new TextEditingController();
  String testAnswer;

  @override
  void initState() {
    super.initState();
    DBManagerSWOT.openDB();

    customController.addListener(() {
      setState(() {
        testAnswer = customController.text;
      });
    });
  }

  var items = [
    "one",
    "two",
    "three",
    "four",
  ];

  var list = [
    "Strengths",
    "Weaknesses",
    "Opportunities",
    "Threats",
  ];

   var lists = [
    "Add a Strength",
    "Add a Weakness",
    "Add an Opportunity",
    "Add a Threat",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('SWOT analysis for: '+ widget.title),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.black, Colors.blue])),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.input),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SWOTSummary(widget.modelId)));
                }),
          ], 
          ),
        
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.blue, Colors.black])),
      ),
      SafeArea(
          child: ListView(
        children: <Widget>[
          cardView("Strengths", items[0], list[0],lists[0]),
          cardView("Weaknesses",items[1], list[1],lists[1]),
          cardView("Opportunities",items[2], list[2],lists[2]),
          cardView("Threats", items[3], list[3],lists[3]),
        ],
      ))
    ]));
  }

  Widget cardView(String cardName, String answerName, String title, String alertName) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("            $cardName",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
                
              ),)],
            ),
            Row(
              children: <Widget>[
                // SwotDescription(notes[index]['SwotDescription']),
                // Text(description)
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  //                splashColor: Colors.grey,
                  color: Colors.white,
                  child: Text(
                    "Add New Answer",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                    return Alert(
                        context: context,
                        title:  alertName + ":",
                        content: TextField(
                          controller: customController,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text('Done'),
                            onPressed: () {
                              Navigator.pop(context);
                              final answer = customController.text;
                              print(answer);
                              DBManagerSWOT.insertCustSegNote({
                                'answer': answer.toString(),
                                'modelID': widget.modelId
                              }, answerName);
                              customController.clear();
                            },
                          )
                        ]).show();
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    "View Exising answers",
                    style: TextStyle(color: Uidata.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                      MaterialPageRoute(
                            builder: (context) =>
                                SWOT1List(answerName, widget.modelId,title)));
                  },
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}



class SWOT1List extends StatefulWidget {
  final String question;
  final int modelId;
  final String title;

  SWOT1List(this.question, this.modelId, this.title);
  @override
  SWOT1ListState createState() {
    return new SWOT1ListState();
  }
}

class SWOT1ListState extends State<SWOT1List> {
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
            future: DBManagerSWOT.getLists(widget.question, widget.modelId),
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
                                  builder: (context) => SwotAnswers1(
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


class SwotAnswers1 extends StatefulWidget {
  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String answerName;

  SwotAnswers1(this.noteMode, this.note, this.answerName);

  @override
  SwotAnswers1State createState() {
    return SwotAnswers1State();
  }
}

class SwotAnswers1State extends State<SwotAnswers1> {
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
                  DBManagerSWOT.updateCustSegNote(
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
                          await DBManagerSWOT.deleteNote(
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

 