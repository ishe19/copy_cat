import 'package:flutter/material.dart';
import 'swot_home.dart' as swot;
import 'canvas_home.dart' as canvas;
import 'utils/drawer.dart';


class Dashboard extends StatefulWidget {
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
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text("Copy Cat"),
        bottom: TabBar(
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