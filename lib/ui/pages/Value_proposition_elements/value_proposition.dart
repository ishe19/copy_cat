import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/value_prop_elements.dart' as customer;
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';





class ValueDashboard extends StatefulWidget{
 @override 

   ValueDashboardState createState() => ValueDashboardState();


}
class ValueDashboardState extends State<ValueDashboard> {
  @override 

  
   Widget build(BuildContext context) {
    
    return Container(
      child: FutureBuilder(
       future: DBManagerCustomer.getCustomerList(),
        builder: (context, snapshot) {
          final notes = snapshot.data;
          
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                String customerTitle = notes[index]['customerTitle'];
                
                return Padding(
                      padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                     CustomerTitle(notes[index]['customerTitle']),
                                    ],
                                  ),
                                  
                                  Row(
                                    children: <Widget>[
                                      FlatButton(
                                        color: Colors.white,
                                        child: Text("Customer Details", style: TextStyle(color: Uidata.primaryColor),),
                                        onPressed: (){
                                                          
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

class ValueHome extends StatelessWidget{

  @override
   Widget build(BuildContext context) {
    
    return Scaffold(
//      drawer: SideDrawer(),
      
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Value Proposiion"),
        
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => customer.CustomerDetails(customer.NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
      ),
      body:
          ValueDashboard(),
          
        
      

    );
  }
}