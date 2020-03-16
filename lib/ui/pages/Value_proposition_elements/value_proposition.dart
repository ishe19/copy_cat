import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/answers1_list.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/value_prop_elements.dart' as subject;
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:copy_cat/models/db2.dart';


enum NoteMode { 
  Editing,
  Adding
}


class ValueDashboard extends StatefulWidget{

  
  @override 
  ValueDashboardState createState() => ValueDashboardState();


}
class ValueDashboardState extends State<ValueDashboard> {
  @override 

  
   Widget build(BuildContext context) {
    
    return Scaffold(
//      drawer: SideDrawer(),
      
     // // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Value Proposition canvas"),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => subject.CustomerDetails(subject.NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: DBManagerCustomer.getSubjectList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return  Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                        color: Colors.grey.shade200,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.only(top:5.0, left: 15.0),
                                       child: CustomerTitle(notes[index]['SubjectTitle']),
                                     ),
                                    ],
                                  ),
                                  
                                  Row(
                                    children: <Widget>[
                                      FlatButton(
                                        color: Colors.white,
                                        child: Text("Customer details", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerElements(notes[index]['id'])));
                                                          
                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("EDIT Customer", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(modelTitle, notes[index]['id'])));
                                      },
                                    ),
                                    IconButton(
                                       icon: Icon(Icons.delete),
                                       onPressed: (){
                                         DBManagerCustomer.deleteSubject(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    )
   
                  ),
                ),
                );
              },
              itemCount: notes == null? 0 : notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  
  }
}





class CustomerTitle extends StatelessWidget {
  final String _title;

  CustomerTitle(this._title);

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


class CustomerElements extends StatefulWidget {
  // final cameras;
  // Dashboard(this.cameras);

   final int modelId;
   CustomerElements(this.modelId);
  @override
  CustomerElementsState createState() => CustomerElementsState();
}

class CustomerElementsState extends State<CustomerElements> with SingleTickerProviderStateMixin {

  TabController inAppTabController;


  @override
  void initState(){
    super.initState();
    inAppTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    inAppTabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text("Customer Details"),
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
        IconButton( icon: Icon(Icons.help),
          onPressed: (){
            //                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Questions()));

          }),
          IconButton( icon: Icon(Icons.input),
          onPressed: (){
           //                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Questions()));

          }),
        ],
        bottom: 
        TabBar(
          controller: inAppTabController,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.pages),
              child: Text("Customer "),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("Product "),
            ),
          ],
        ),
      ),
      body: Stack(fit: StackFit.expand,
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.bottomLeft,
            end: Alignment.topRight,
            colors:[
              Colors.blue,
              Colors.black
            ]
          )
        ),
        ),
      TabBarView(
        
        controller: inAppTabController,
        children: <Widget>[
          CustomerCategory(widget.modelId),
          ProductCategory(widget.modelId),
        ],
      ),
      ]
      )
      );
  }
}

class CustomerCategory extends StatefulWidget {

 final int modelId;
  CustomerCategory(this.modelId);

  @override
  _CustomerCategoryState createState() => _CustomerCategoryState();
}

class _CustomerCategoryState extends State<CustomerCategory> {

  TextEditingController customController = new TextEditingController();
  String testAnswer;



  

  @override
  void initState(){
    super.initState();
      DBManagerAnswers.openDB();


    customController.addListener(
      (){
        setState(() {
          testAnswer = customController.text;
        });
      }
    );
  }

  var items = [
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",

];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand,
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.bottomLeft,
            end: Alignment.topRight,
            colors:[
              Colors.blue,
              Colors.black
            ]
          )
        ),
      ),SafeArea(
        child: ListView(
          children: <Widget>[
            cardView("What is the customer category?",items[0]),
            cardView("What are the current negative/undesirable Experiences",items[1]),
            cardView("What are the concerns about the current solutions",items[2]),
            cardView("Unmet needs",items[3]),
            cardView("What are the Competing products?",items[4]),
            cardView("How does the competing product performance compare?",items[5]),
  
                        ],
            )
            )
            ]
      )
      );
  }
  Widget cardView(String cardName, String answerName){
  return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text("$cardName")
                                    ],
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
                                        child: Text("Add New Answer", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
return Alert(             
              context: context,
              title: 'Answer',
              content: TextField(
                controller: customController,
              ),
              buttons: [
                DialogButton(
                child: Text('Done'),
                onPressed: (){
                  Navigator.pop(context);
                  final answer = customController.text;
                  print(answer);
                    DBManagerAnswers.insertCustSegNote({
                        'answer': answer.toString(),
                    },
                    answerName 
                    );
                      customController.clear();
                  
                },)
              ]).show();                    
                },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Answer1List(answerName, widget.modelId ))); 
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                    },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    );
  }
}


class ProductCategory extends StatefulWidget {

  final int modelID;

  ProductCategory(this.modelID);

  @override
  ProductCategoryState createState() => ProductCategoryState();
}

class ProductCategoryState extends State<ProductCategory> {

  TextEditingController customController = new TextEditingController();
  String testAnswer;
  

  @override
  void initState(){
    super.initState();

    customController.addListener(
      (){
        setState(() {
          testAnswer = customController.text;
        });
      }
    );
  }

  var items = [
  "Answer1",
  "Answer2",
  "Answer3",
  "Answer4",
  "Answer5",
  "Answer6",

];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(fit: StackFit.expand,
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.bottomLeft,
            end: Alignment.topRight,
            colors:[
              Colors.blue,
              Colors.black
            ]
          )
        ),
      ),SafeArea(
        child: ListView(
          children: <Widget>[
            cardView("What is the customer category?",items[0]),
            cardView("What is the customer category?",items[0]),
            cardView("What is the customer category?",items[0]),
            cardView("What is the customer category?",items[0]),
            cardView("What is the customer category?",items[0]),
            cardView("What is the customer category?",items[0]),
              
                        ],
                      ),
                    ),
      ]),
    );
                }
    Widget cardView(String cardName, String answerName){
  return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text("$cardName")
                                    ],
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
                                        child: Text("Add New Answer", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
                },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Answer1List(answerName, widget.modelID ))); 
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                    },
                                    ),
                                  ],
                                )]))));
                            
                          
                        
                          
  }             
            }


class Questions extends StatelessWidget{

  @override 

  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
        title: Text("Value Proposition Key Questions"),
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
      ),     
      body: Stack(fit: StackFit.expand,
      children: <Widget>[
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.bottomLeft,
            end: Alignment.topRight,
            colors:[
              Colors.blue,
              Colors.black
            ]
          )
        ),
        ),
        SafeArea(
        child: ListView(
          children: <Widget>[           
            ListTile(
              title: Text('A: Who are the customers/beneficiaries of your intervention?',
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle: Text(''),
                            onTap: (){   
                            },
                          ),
                          Divider(
                            color:  Colors.white,
                          ),
            ListTile(
              title: Text("B: What is each customer's current lived reality?",
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle: Text('B1:Negative experiences,   B2:unmet needs,    B3: concerns about current solutions',
              style: TextStyle(
                color: Colors.white
              ),),
                            onTap: (){   
                            },
                          ),
                          Divider(
                            color:  Colors.white,
                          ),
            ListTile(
              title: Text('C: What are you offering(product/service)?',
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle: Text(''),
                            onTap: (){   
                            },
                          ),
                          Divider(
                            color:  Colors.white,
                          ),
          ListTile(
              title: Text("D: How does your offering respond to the customer's current lived realities?",
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle: Text(''),
                            onTap: (){   
                            },
                          ),
                          Divider(
                            color:  Colors.white,
                          ),
            ListTile(
              title: Text('E: What sets you or your product/ service apart from alternative solution providers?',
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle: Text(''),
                            onTap: (){   
                            },
                          ),
                          Divider(
                            color:  Colors.white,
                          ),
          ListTile(
              title: Text('F: What proof do you have that your product/ service does  what you say it does?',
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle: Text(''),
                            onTap: (){   
                            },
                          ),
                          Divider(
                            color:  Colors.white,
                          ),
          ]

  ),
  ),
      ],
      ),
      );
  }
  }


  class Answers1 extends StatefulWidget {


  final NoteMode noteMode;
  final Map<String, dynamic> note;
  final String answerName;


  Answers1(this.noteMode, this.note, this.answerName);

  @override
  Answers1State createState() {
    return Answers1State();
  }
}

class Answers1State extends State<Answers1> {


  final TextEditingController _textController = TextEditingController();
  
  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
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
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Your answer'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final answer = _textController.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    DBManagerAnswers.insertCustSegNote ({

                      'answer': answer
                    }, 
                    widget.answerName
                    );
                  } else if (widget?.noteMode == NoteMode.Editing) {
                  DBManagerAnswers.updateCustSegNote ({
                    'id': widget.note['id'],
                      'answer': answer
                    },
                    widget.answerName
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
                      await DBManagerAnswers.deleteNote(widget.note['id'], widget.answerName);
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
