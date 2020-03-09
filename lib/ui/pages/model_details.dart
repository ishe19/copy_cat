import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/canvas_elements/canvas_model.dart';
import 'package:copy_cat/ui/pages/swot_elements/final_table.dart';
import 'package:copy_cat/ui/pages/view_post.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:copy_cat/models/db2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'igc.dart';
import 'igc_table.dart';


  



class ModelDetails extends StatefulWidget {
  final int modelId;
  final String modelTitle;

  ModelDetails(this.modelTitle, this.modelId);

  @override
  _ModelDetailsState createState() => _ModelDetailsState();
}

class _ModelDetailsState extends State<ModelDetails> {
//  double height = MediaQuery.of(context).size.height;



@override 
void initState(){
  super.initState();
  DBManagerViews.openDB();
  DBManagerGuide.openDB();
}

var items = [
  "Customer Segments",
  "Value Propositions",
  "Channels",
  "Customer Relationships",
  "Revenue Stream",
  "Key Resources",
  "Key Activities",
  "Key Partners",
  "Cost Structure"
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modelTitle),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CanvasModelR(widget.modelId)));
        },
        child: Icon(Icons.exit_to_app),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
//            defaultColumnWidth: FractionColumnWidth(0.32),
              children: [
                TableRow(
                  children: [
                    cardView("Customer Segments", Icon(Icons.bluetooth_searching)),
                    cardView("Value Propositions", Icon(Icons.view_array)),
                    cardView("Channels", Icon(Icons.view_array)),
                  ]
                ),
                TableRow(
                    children: [
                      cardView("Customer Relationships", Icon(Icons.view_array)),
                      cardView("Revenue Streams", Icon(Icons.view_array)),
                      cardView("Key Resources", Icon(Icons.view_array)),
                    ]
                ),
                TableRow(
                    children: [
                      cardView("Key Activities", Icon(Icons.view_array)),
                      cardView("Key Partners", Icon(Icons.view_array)),
                      cardView("Cost Structure", Icon(Icons.view_array)),
                    ]
                ),
              ],
            ),
          ),
      ),
    );
  }

Widget cardView(String cardName, Icon icon){
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPost(cardName, widget.modelId)));
      },
      child: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),

                Text("$cardName", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
            
          ],
        ),
      ),
    ),
  );
}

}



class Pages extends StatefulWidget {
  

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with SingleTickerProviderStateMixin {

  TabController inAppTabController;


   @override
  void initState(){
    super.initState();
    inAppTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    inAppTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => IGCTableFinal()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => IGCTable()));
        },
        child: Icon(Icons.arrow_forward)
      ),
      appBar: AppBar(
        title: Text("IGC"),
        centerTitle: true,
        bottom: 
        TabBar(
          controller: inAppTabController,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.pages),
              child: Text("Challenge Mapping"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("solutions mapping"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("impact gaps"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: inAppTabController,
        children: <Widget>[
          Challenges(),
         Solutions() ,
         ImpactGap()
          
        ],
      ),
    );
  }
}










  Future<Widget> listMethod(int i, BuildContext context) async {
    String test = await DBManagerGuide.getListChall(i).toString();
    return ListView.builder(
      itemBuilder: (context, i){
        return Text(test);
      },
    );
  }
             


class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);
  
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



class ModelTitle extends StatelessWidget {
  final String _title;

  ModelTitle(this._title);

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



class ModelDescription extends StatelessWidget {
  String description;

  ModelDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextStyle(color: Colors.grey.shade600), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}






final formkey = new GlobalKey<FormState> ();











