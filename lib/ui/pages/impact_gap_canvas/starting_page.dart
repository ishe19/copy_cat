
import 'package:copy_cat/ui/pages/impact_gap_canvas/igc.dart';
import 'package:copy_cat/ui/pages/impact_gap_canvas/igc_table.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/pages/Value_proposition_elements/value_prop_elements.dart'as object;


enum NoteMode { 
  Editing,
  Adding
}


class IGCDashboard extends StatefulWidget {

  final String title;
  IGCDashboard(this.title);

  @override
  IGCDashboardState createState() => IGCDashboardState();
}

class IGCDashboardState extends State<IGCDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: SideDrawer(),

      // // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("IGC Generator"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Uidata.btnColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      object.IGCDetails(object.NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: DBManagerIGC.getSubjectList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
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
                                          padding: const EdgeInsets.only(
                                              top: 5.0, left: 15.0),
                                          child: CustomerTitle(
                                              notes[index]['SubjectTitle']),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        FlatButton(
                                          color: Colors.white,
                                          child: Text(
                                            "IGC Details",
                                            style: TextStyle(
                                                color: Uidata.primaryColor),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context,MaterialPageRoute(builder: (context) =>IGCElements(widget.title,notes[index]['id'])));
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.white,
                                          child: Text(
                                            "EDIT IGC",
                                            style: TextStyle(
                                                color: Uidata.primaryColor),
                                          ),
                                          onPressed: () {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ModelDetails(modelTitle, notes[index]['id'])));
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            DBManagerCustomer.deleteSubject(
                                                notes[index]['id']);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))),
                  ),
                );
              },
              itemCount: notes == null ? 0 : notes.length,
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
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class IGCElements extends StatefulWidget {
  // final cameras;
  // Dashboard(this.cameras);

  final int modelId;
  final String title;
  IGCElements(this.title,this.modelId);
  @override
  IGCElementsState createState() => IGCElementsState();
}

class IGCElementsState extends State<IGCElements>
    with SingleTickerProviderStateMixin {
  TabController inAppTabController;

  @override
  void initState() {
    super.initState();
    inAppTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    inAppTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: SideDrawer(),
        appBar: AppBar(
          title: Text("IGC Details for: " + widget.title),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.black, Colors.blue])),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                }),
            IconButton(
                icon: Icon(Icons.input),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => IGCTable(widget.modelId)));
                }),
          ],
          bottom: TabBar(
            controller: inAppTabController,
            tabs: <Widget>[
              Tab(
//              icon: Icon(Icons.pages),
                child: Text("Challenges "),
              ),
              Tab(
//              icon: Icon(Icons.business),
                child: Text("Solutions "),
              ),
              Tab(child: Text("Impact gaps"),)
            ],
          ),
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.black])),
          ),
          TabBarView(
            controller: inAppTabController,
            children: <Widget>[
              Challenges(widget.modelId),
               Solutions(widget.modelId),
                ImpactGaps(widget.modelId)
            ],
          ),
        ]));
  }
    }