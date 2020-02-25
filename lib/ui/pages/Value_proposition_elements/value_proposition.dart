import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/value_prop_elements.dart' as customer;
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';





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
        
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => customer.CustomerDetails(customer.NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
       future: DBManagerCustomer.getCustomerList(),
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
                                       child: CustomerTitle(notes[index]['customerTitle']),
                                     ),
                                    ],
                                  ),
                                  
                                  Row(
                                    children: <Widget>[
                                      FlatButton(
                                        color: Colors.white,
                                        child: Text("Customer details", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerElements()));
                                                          
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
                                         DBManagerCustomer.deleteCustomer(notes[index]['id']);
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
        actions: <Widget>[
        IconButton( icon: Icon(Icons.help),
          onPressed: (){

          }),
        ],
        bottom: 
        TabBar(
          controller: inAppTabController,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.pages),
              child: Text("Customer Category"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("Product Category"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: inAppTabController,
        children: <Widget>[
          CustomerCategory(),
          ProductCategory(),
        ],
      ),

    );
  }
}

class CustomerCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ListTile(
              leading:  IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'B1',
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
              title: Text('Current Negative/ undesirable Experiences'),
              subtitle: Text('guiding questions'),
                            onTap: (){
                            //  pushChallengePage(context, "How do you describe the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),
                          Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'B2',
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
                            title: Text('Unmet needs'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                            //  pushChallengePage(context, "What is the impact of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'B3',
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
                            title: Text('Concerns about the current solution?'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                             // pushChallengePage(context, "What is the cause of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),
                          Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'E1',
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
                            title: Text('Competing products'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                             // pushChallengePage(context, "What is the history and future of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),
                          
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'F1',
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
                            title: Text('Competing product performance'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                             // pushChallengePage(context, "What is the history and future of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
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
            }



class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ListTile(
              leading:  IconButton(
          icon: Icon(Icons.info),
          onPressed: (){return Alert(
              context: context,
              title: 'B1',
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
              title: Text('Current Negative/ undesirable Experiences'),
              subtitle: Text('guiding questions'),
                            onTap: (){
                            //  pushChallengePage(context, "How do you describe the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),
                          Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'B2',
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
                            title: Text('Unmet needs'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                            //  pushChallengePage(context, "What is the impact of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'B3',
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
                            title: Text('Concerns about the current solution?'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                             // pushChallengePage(context, "What is the cause of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),
                          Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'E1',
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
                            title: Text('Competing products'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                             // pushChallengePage(context, "What is the history and future of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
                          ),
                          Divider(
                            color:  Colors.black,
                          ),
                          Divider(
                            color:  Colors.black,
                          ),
                          ListTile(
                            leading: IconButton(
                        icon: Icon(Icons.info),
                        onPressed: (){return Alert(
                            context: context,
                            title: 'F1',
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
                            title: Text('Competing product performance'),
                            subtitle: Text('guiding questions'),
                            onTap: (){
                             // pushChallengePage(context, "What is the history and future of the challenge?");
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengeNote(NoteMode.Adding, null, )));
                            },
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
            }