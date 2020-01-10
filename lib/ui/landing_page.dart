import 'package:flutter/material.dart';
import 'dashboard.dart' as dash;
import 'profile.dart' as prof;

class LandingPage extends StatefulWidget {
  // final cameras;
  // LandingPage(this.cameras);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 52,
        child: Material(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              tabs: <Widget>[

                Tab(
                  icon: Icon(Icons.dashboard, color: Colors.black,),
                  child: Text("Dashboard", style: TextStyle(color: Colors.black,)),
                ),
                Tab(
                  icon: Icon(Icons.person, color: Colors.black,),
                  child: Text("Profile", style: TextStyle(color: Colors.black,),),
                ),
              ],
            )
        ),
      ),
      body: TabBarView(
      controller: tabController,
      children: <Widget>[
        dash.Dashboard(),
        //  dash.Dashboard(widget.cameras),
        prof.ProfileView(),
      ],
    ),

    );
  }
}






