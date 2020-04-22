import 'package:copy_cat/ui/pages/impact_gap_canvas/answer_tiles.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:copy_cat/models/db2.dart';


enum NoteMode { 
  Editing,
  Adding
}


class Challenges extends StatefulWidget {
  final int modelId;
  Challenges(this.modelId);

  @override
  ChallengesState createState() =>ChallengesState();
}

class ChallengesState extends State<Challenges> {
  TextEditingController customController = new TextEditingController();
  String testAnswer;

  @override
  void initState() {
    super.initState();
    DBManagerGuide1.openDB();

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
    "five",
    "six",
  ];

  var list = [
    "How do you describe the challenge?",
    "Who are the affected parties",
    "What is the impact of the challenge?",
    "What is the cause of the challenge?",
    "What is the history and future of the challenge?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          cardView("How do you describe the challenge?", items[0], list[0]),
          cardView("Who are the affected parties?",items[1], list[1]),
          cardView("What is the impact of the challenge?",items[2], list[2]),
          cardView("What is the cause of the challenge?", items[3], list[3]),
          cardView("What is the history and future of the challenge?", items[4], list[4]),
        ],
      ))
    ]));
  }

  Widget cardView(String cardName, String answerName, String title) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("$cardName")],
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
                        title: cardName,
                        desc: 'Answer',
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
                              DBManagerGuide1.insertCustSegNote({
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
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>IgcAnswers(answerName, widget.modelId,title)));
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


class Solutions extends StatefulWidget {
  final int modelId;
  Solutions(this.modelId);

  @override
  SolutionsState createState() =>SolutionsState();
}

class SolutionsState extends State<Solutions> {
  TextEditingController customController = new TextEditingController();
  String testAnswer;

  @override
  void initState() {
    super.initState();
    DBManagerGuide1.openDB();

    customController.addListener(() {
      setState(() {
        testAnswer = customController.text;
      });
    });
  }

  var items = [
    "six",
    "seven",
    "eight",
    "nine"

  ];

  var list = [
    "What is happening locally?",
    "What is happening globally?",
    "What is working and what isn't?",
    "Where is the focus and the future?",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          cardView("What is happening locally?", items[0], list[0]),
          cardView("What is happening globally?",items[1], list[1]),
          cardView("What is working and what isn't",items[2], list[2]),
          cardView("Where is the focus and the future?", items[3], list[3]),
        ],
      ))
    ]));
  }

  Widget cardView(String cardName, String answerName, String title) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("$cardName")],
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
                        title: cardName ,
                        desc: 'Answer',
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
                              DBManagerGuide1.insertCustSegNote({
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
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>Igc1Answers(answerName, widget.modelId,title)));
                  },
                )
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}


class ImpactGaps extends StatefulWidget {
  final int modelId;
  ImpactGaps(this.modelId);

  @override
  ImpactGapsState createState() =>ImpactGapsState();
}

class ImpactGapsState extends State<ImpactGaps> {
  TextEditingController customController = new TextEditingController();
  String testAnswer;

  @override
  void initState() {
    super.initState();
    DBManagerGuide1.openDB();

    customController.addListener(() {
      setState(() {
        testAnswer = customController.text;
      });
    });
  }

  var items = [
    "ten",
    "eleven",
    "twelve",
    "thirteen",
  ];

  var list = [
    "Where are the gaps between the challenges and solutions?",
    "what are the gaps within the solutions?",
    "What are the unaddressed obstacles?",
    "What are the key lessons learned?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          cardView("Where are the gaps between the challenges and solutions?", items[0], list[0]),
          cardView("what are the gaps within the solutions?",items[1], list[1]),
          cardView("What are the unaddressed obstacles?",items[2], list[2]),
          cardView("What are the key lessons learned?", items[3], list[3]),
        ],
      ))
    ]));
  }

  Widget cardView(String cardName, String answerName, String title) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("$cardName")],
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
                        title: cardName,
                        desc: 'Answer',
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
                              DBManagerGuide1.insertCustSegNote({
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
                  onPressed: () { Navigator.push( context, MaterialPageRoute( builder: (context) =>Igc2Answers(answerName, widget.modelId,title)));
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










