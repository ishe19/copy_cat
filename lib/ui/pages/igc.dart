import 'package:copy_cat/ui/pages/swot_elements/final_table.dart';
import 'package:copy_cat/ui/pages/view_igc.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:copy_cat/providers/opps_providers.dart';
import 'package:copy_cat/models/db2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum NoteMode { 
  Editing,
  Adding
}

returnPageFunction(String name, String question) {
    if(name == "Challenges"){
      return ChallengeNote(NoteMode.Adding, null, question);
    }else if(name == "Solutions"){
      return SolutionNote(NoteMode.Adding, null, question);
    } else if(name == "Impact Gap"){
      return ImpactNote(NoteMode.Adding, null, question);
    }
  }




class Challenges extends StatelessWidget {


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => IGCTableFinal()));
        },
        child: Icon(Icons.arrow_forward)
      ),
      body: SafeArea( 
        child: ListView(
          children: <Widget>[
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue.shade700,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("What is happening, what is the impact of the challenge, and what is holding the challenge in place", style: TextStyle(color: Colors.white),),),
          ),
            Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading:  IconButton(
                  icon: Icon(Icons.info),
                  onPressed: (){return Alert(
                        context: context,
                        title: 'guiding question',
                        desc:'How do those impacted by the challenge describe the challenge? How do they describe the effects?How is this challenge related to other challenges?',
                        buttons: [
                          DialogButton(
                          child: Text('Got it'),
                          onPressed: (){
                            Navigator.pop(context);

                          },)
                        ]).show();
                        },
                    ),
                    title: Text('How do you describe the challenge?'),
                    subtitle: Text('guiding questions'),
                      onTap: (){
                        
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                      },
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "How do you describe the challenge?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "How do you describe the challenge?", "View");
                    },
                  ),
              ],)
              ],
            ),
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: (){return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'What are the numbers? Who or what is impacted(where, how many, in what way?)What does the research say?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                                          Navigator.pop(context);

                      },)
                    ]).show();
                    },
                    ),
                    title: Text('What is the impact of the challenge?'),
                    subtitle: Text('guiding questions'),
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                    },
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "What is the impact of the challenge?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "What is the impact of the challenge?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),Divider(
              color:  Colors.black,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: (){return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'What is causing the challenge to persist? Who stands to benefit from the challenge continuing to persist?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                                          Navigator.pop(context);

                      },)
                    ]).show();
                    },
                    ),
                    title: Text('What is the cause of the challenge?'),
                    subtitle: Text('guiding questions'),
                    
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "What is the cause of the challenge?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "What is the cause of the challenge?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
                child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: (){return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'How has the challenge changed over time? What is the projected scope of the challenge in the future?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                        Navigator.pop(context);

                      },)
                    ]).show();
                    },
                    ),
                    title: Text('What is the history and future of the challenge?'),
                    subtitle: Text('guiding questions'),
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "What is the history and future of the challenge?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushChallengePage(context, "What is the history and future of the challenge?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: Tap on the information icon for a guiding question. ", style: TextStyle(color: Colors.white),),),
          ),
          Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue.shade700,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: tap on the tile to add or edit your answer", style: TextStyle(color: Colors.white),),),
          ),
          ],
        ),
      ),
      );
  }

  void pushChallengePage(BuildContext context, question, String type) {
    if(type == "Add"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => returnPageFunction("Challenges", question)));
    }else if(type == "View"){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewIGC("Challenges", question)));
    }
      // Navigator.push(context, MaterialPageRoute(builder: (context) => challengeDetail.ChallengeDetails(challengeDetail.NoteMode.Adding, null)));
    }


                }


class ImpactGap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => IGCTableFinal()));
        },
        child: Icon(Icons.arrow_forward)
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue.shade700,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("What is missing that could close the gap between the challenge and the current solutions, where are opportunities for greater collective impact, and what are the key lesons learned?", style: TextStyle(color: Colors.white),),),
          ),
          Divider(
              color:  Colors.black,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
                  return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'Who or what is not being served and what is missing to bridge that gap? What actions can be taken to fill those gaps?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                        Navigator.pop(context);

                      },)
                    ]).show();
          },
        ),
                    title: Text('Where are the gaps between the challenge and solutions?'),
                    subtitle: Text('guiding questions'),                    
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "Where are the gaps between the challenge and solutions?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "Where are the gaps between the challenge and solutions?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),

            Divider(
              color:  Colors.black,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
          return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'What is missing(specific regulations, knowledge sharing, new efforts,partnership etc)that would further link up the solutions and achieve greater collective impact?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                                          Navigator.pop(context);

                      },)
                    ]).show();
          },
        ),
                    title: Text('What are the gaps within the solutions?'),
                    subtitle: Text('guiding questions'),
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "What are the gaps within the solutions?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "What are the gaps within the solutions?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),Divider(
              color:  Colors.black,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
                  return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'What is being overlooked and what are the unintended negative consequences of the existing efforts? What specific key opportunities could unlock future impact?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                        Navigator.pop(context);

                      },)
                    ]).show();
          },
        ),
                    title: Text('Where are the unaddressed obstacles?'),
                    subtitle: Text('guiding questions'),                  
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "Where are the unaddressed obstacles?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "Where are the unaddressed obstacles?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){
                  return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'From yout research and interviews, what key lessons could you share with anyone who wants to impact change in this sector? What are the biggest opportunities for impact?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                        Navigator.pop(context);

                      },)
                    ]).show();
          },
        ),
                    title: Text('What are the key lessons learned?'),
                    subtitle: Text('guiding questions'),
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "What are the key lessons learned?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushImpactPage(context, "What are the key lessons learned?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),
            Divider(
              color:  Colors.black,
            ),
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue.shade700,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: Tap on the information icon for a guiding question. ", style: TextStyle(color: Colors.white),),),
          ),
          Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue.shade700,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("Hints: tap on the tile to add or edit your answer", style: TextStyle(color: Colors.white),),),
          ),
          ],
        ),
      ),
      );
  }

  void pushImpactPage(BuildContext context, String question, String type) {
    if(type == "Add"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => returnPageFunction("Impact Gap", question)));
    }else if(type == "View"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewIGC("Impact Gap", question)));
    }
    }



}

class Solutions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => IGCTableFinal()));
        },
        child: Icon(Icons.arrow_forward)
      ),
      body:  ListView(
          children: <Widget>[
            Card(
            // height: 200,
            // width: 250.0,
            color: Colors.blue.shade700,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text("What models  are already being tried, what is working and what is not, and what resources are available?", style: TextStyle(color: Colors.white),),),
          ),
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
                    context: context,
                    title: 'guiding question',
                    desc:'What resources are available that can be drawn upon? What efforts are already being tried which could directly impact the callenge? what are the different models? How are they joined up, or not?',
                    buttons: [
                      DialogButton(
                      child: Text('Got it'),
                      onPressed: (){
                        Navigator.pop(context);
                      },)
                    ]).show();
                    },
                    ),
                    title: Text('What is happening locally?'),
                    subtitle: Text('guiding questions'),
                    ),
                    Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushSolutionsPage(context, "What is happening locally?", "Add");
                    },
                  ),
                  FlatButton(
                    color: Uidata.btnColor,
                    child: Text("View", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pushSolutionsPage(context, "What are the key lessons learned?", "View");
                    },
                  ),
              ],)
                ],
              ),
            ),
                            Divider(
                              color:  Colors.black,
                            ),
                            Card(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.info),
                                    title: Text('What is happening globally?'),
                                    subtitle: Text('guiding questions'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FlatButton(
                                        color: Uidata.btnColor,
                                        child: Text("Add", style: TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          pushSolutionsPage(context, "What is happening globally?", "Add");
                                        },
                                      ),
                                      FlatButton(
                                        color: Uidata.btnColor,
                                        child: Text("View", style: TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          pushSolutionsPage(context, "What is happening globally?", "View");
                                        },
                                      ),
                                  ],)
                                ],
                              ),
                            ),
                            Divider(
                              color:  Colors.black,
                            ),
                            Card(
                              child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.info),
                                  title: Text('What is working, what is not?'),
                                  subtitle: Text('guiding questions'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                      color: Uidata.btnColor,
                                      child: Text("Add", style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        pushSolutionsPage(context, "What is working, what is not?", "Add");
                                      },
                                    ),
                                    FlatButton(
                                      color: Uidata.btnColor,
                                      child: Text("View", style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        pushSolutionsPage(context, "What is working, what is not?", "View");
                                      },
                                    ),
                                ],)
                              ],
                              )
                            ),
                            Divider(
                              color:  Colors.black,
                            ),
                            Card(
                              child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.info),
                                  title: Text('Where is the focus and the future?'),
                                  subtitle: Text('guiding questions'),
                                  
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                      color: Uidata.btnColor,
                                      child: Text("Add", style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        pushSolutionsPage(context, "'Where is the focus and the future?", "Add");
                                      },
                                    ),
                                    FlatButton(
                                      color: Uidata.btnColor,
                                      child: Text("View", style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        pushSolutionsPage(context, "'Where is the focus and the future?", "View");
                                      },
                                    ),
                                ],)
                              ],
                              )
                            ),
                            Divider(
                              color:  Colors.black,
                            ),
                            Card(
                            // height: 200,
                            // width: 250.0,
                            color: Colors.blue.shade700,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text("Hints: Tap on the information icon for a guiding question.", style: TextStyle(color: Colors.white),),),
                          ),
                          Card(
                            // height: 200,
                            // width: 250.0,
                            color: Colors.blue.shade700,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text("Hints: tap on the tile to add or edit your answer", style: TextStyle(color: Colors.white),),),
                          ),
                          ],
                        ),
                      ),
                      );
                  }
                
                  

                  

    void pushSolutionsPage(BuildContext context, String question, String type) {
      if(type == "Add"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => returnPageFunction("Solutions", question)));
      }else if(type == "View"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewIGC("Solutions", question)));
      }
    }
}


class SolutionNote extends StatefulWidget {
 
  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String ques;

  SolutionNote(this.noteMode, this.note, this.ques);

  @override
  SolutionNoteState createState() {
    return new SolutionNoteState();
  }
}

class SolutionNoteState extends State<SolutionNote> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Response' : 'Edit Response'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.ques, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Your answer'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final title = _titleController.text;
                  final text = _textController.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    DBManagerGuide.insertSolutions({
                      'question': widget.ques,
                      'title': title,
                    });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                  DBManagerGuide.updateSolutions({
                    'id': widget.note['id'],
                      'title': title,
                    });
                  }
                  Navigator.pop(context);
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await OppsProvider.deleteOpps(widget.note['id']);
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


class ChallengeNote extends StatefulWidget {

  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String ques;

  ChallengeNote(this.noteMode, this.note, this.ques);

  @override
  ChallengeNoteState createState() {
    return new ChallengeNoteState();
  }
}

class ChallengeNoteState extends State<ChallengeNote> {

  final TextEditingController _titleController = TextEditingController();
  

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
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Response' : 'Edit Response'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.ques, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Your answer'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final title = _titleController.text;
                  print("$title");

                  if (widget?.noteMode == NoteMode.Adding) {
                    DBManagerGuide.insertChallenge({
                      'question': widget.ques,
                      'title': title
                    }
                    );
                  } else if (widget?.noteMode == NoteMode.Editing) {
                  DBManagerGuide.updateChallenge({
                    'id': widget.note['id'],
                    'title': title,
                  });
                  }
                  Navigator.pop(context);
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await OppsProvider.deleteOpps(widget.note['id']);
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


class ImpactNote extends StatefulWidget {


  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String ques;

  ImpactNote(this.noteMode, this.note, this.ques);

  @override
  ImpactNoteState createState() {
    return ImpactNoteState();
  }
}

class ImpactNoteState extends State<ImpactNote> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Response' : 'Edit Response'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.ques, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Your answer'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final title = _titleController.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    DBManagerGuide.insertImpact({
                      'question': widget.ques,
                      'title': title
                    }
                    );
                  } else if (widget?.noteMode == NoteMode.Editing) {
                  DBManagerGuide.updateImpacts({
                    'id': widget.note['id'],
                      'title': title
                    }
                    );
                  }
                  Navigator.pop(context);
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await OppsProvider.deleteOpps(widget.note['id']);
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