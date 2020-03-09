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
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Questions()));

          }),
          IconButton( icon: Icon(Icons.input),
          onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Questions()));

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
          CustomerCategory(),
          ProductCategory(),
        ],
      ),
      ]
      )
      );
  }
}

class CustomerCategory extends StatelessWidget {
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
            Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('What is the customer category',
                                    style: TextStyle(
                                      fontSize: 15.0),
                                    ),
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
TextEditingController customController;
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
                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                        return Alert(
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
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('What are the current negative/undesirable Experiences',
                                    style: TextStyle(
                                      fontSize: 14.0
                                      ),)
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                      // DBManagerSwot.deleteModel(notes[index]['id']);
                                    },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('Unmet needs')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                      // DBManagerSwot.deleteModel(notes[index]['id']);
                                    },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('What are the concerns about the current solutions?')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                      // DBManagerSwot.deleteModel(notes[index]['id']);
                                    },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('What are the Competing products?')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                  IconButton(
                                    icon: Icon(Icons.info),
                                    onPressed: (){
                                    // DBManagerSwot.deleteModel(notes[index]['id']);
                                  },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('How does the competing product performance compare?')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
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
                    ),  
                        ],
                      ),
                    ),
      ]),
    );
                }
            }



class ProductCategory extends StatelessWidget {
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
            Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     Text('Define the product/service',
                                     style: TextStyle(
                                       fontSize: 15.0),
                                     ),
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
                                          TextEditingController customController;
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

                },)
              ]).show(); 
              },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info),
                                      onPressed: (){
                                        return Alert(
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
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                  Text('Solutions to current negative/undesirable Experiences',
                                  style: TextStyle(
                                    fontSize: 14.0
                                    ),)
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                     IconButton(
                                       icon: Icon(Icons.info),
                                       onPressed: (){
                                        // DBManagerSwot.deleteModel(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     Text('Solutions to the unmet needs')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
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
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                    Text('What is the response to concerns about current solutions?')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                     IconButton(
                                       icon: Icon(Icons.info),
                                       onPressed: (){
                                        // DBManagerSwot.deleteModel(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     Text('What differentiates your product/service?')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                     IconButton(
                                       icon: Icon(Icons.info),
                                       onPressed: (){
                                        // DBManagerSwot.deleteModel(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     Text('What is your evidence of the product/service performance?')
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
TextEditingController customController;
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

                },)
              ]).show();                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.white,
                                      child: Text("View Exising answers", style: TextStyle(color: Uidata.primaryColor),),
                                      onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SwotDetails(NoteMode.Editing,notes)));
                                      },
                                    ),
                                     IconButton(
                                       icon: Icon(Icons.info),
                                       onPressed: (){
                                        // DBManagerSwot.deleteModel(notes[index]['id']);
                                     },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),  
                        ],
                       ),
                     ),
      ]),
    );
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


 