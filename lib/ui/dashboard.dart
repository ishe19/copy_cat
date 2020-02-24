//import 'package:copy_cat/main.dart';
//import 'package:copy_cat/ui/landing_page.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/value_proposition.dart';
import 'package:copy_cat/ui/pages/model_details.dart';
import 'package:copy_cat/ui/pages/new_model.dart' as newModel;
import 'package:copy_cat/ui/pages/swot_elements/swot_details.dart' as swotDetail;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'swot_home.dart' as swot;
import 'canvas_home.dart' as canvas;
//import 'utils/drawer.dart';


class Dashboard extends StatefulWidget {
  // final cameras;
  // Dashboard(this.cameras);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
        SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "New Canvas",
          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => newModel.NewModel(null , newModel.NoteMode.Adding)));
          }
        ),
        SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "New SWOT",
          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => swotDetail.SwotDetails(swotDetail.NoteMode.Adding, null)));
          },
        ),
          SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "IGC",
          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Pages()));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.note_add),
          label: "Value proposition",
          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ValueHome()));
          },
        ),
        ]
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Copy Cat"),
        bottom: 
        TabBar(
          controller: inAppTabController,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.pages),
              child: Text("Canvas"),
            ),
            Tab(
//              icon: Icon(Icons.business),
              child: Text("SWOT Analysis"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: inAppTabController,
        children: <Widget>[
          canvas.CanvasHome(),
          swot.SWOTHome(),
        ],
      ),

    );
  }
}