import 'package:copy_cat/ui/utils/project%20_dashboard.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/models/db_manager.dart';

class ProjectsHome extends StatefulWidget {
  @override
  ProjectsHomeState createState() => ProjectsHomeState();
}

class ProjectsHomeState extends State<ProjectsHome> {

   var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
    });

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: SideDrawer(),

      // // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Current Projects"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blue, Colors.black])),
          ),
          SafeArea(
            child: Container(
              child: FutureBuilder(
                future: DBManagerProjects.getItemList(),
                builder: (context, snapshot) {
                  final notes = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
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
                                        ModelTitle(notes[index]['ModelTitle']),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        ModelDescription(
                                            notes[index]['ModelDescription']),
                                        // Text(description)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        FlatButton(
                                          color: Colors.white,
                                          child: Text(
                                            "PROJECT DETAILS",
                                            style: TextStyle(
                                                color: Uidata.primaryColor),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProjectDash(
                                                            notes[index]
                                                                ['ModelTitle'],
                                                            notes[index]
                                                                ['id'])));
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.white,
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                color: Uidata.primaryColor),
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            DBManagerProjects.deleteItem(
                                                notes[index]['id']);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: notes == null ? 0 : notes.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
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
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class ModelDescription extends StatelessWidget {
  final String description;

  ModelDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(color: Colors.grey.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
