import 'package:copy_cat/models/db_manager.dart';
import 'package:copy_cat/ui/new_projects.dart' as newProject;
import 'package:copy_cat/ui/profile.dart';
import 'package:copy_cat/ui/utils/app_title.dart';
import 'package:copy_cat/ui/utils/cover_text.dart';
import 'package:copy_cat/ui/utils/current_projects.dart' as currentProjects;
import 'package:flutter/material.dart';
import 'dart:async';

Future<Null> main() async {
  runApp(new CopyCat());
}

class CopyCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "R.O.P.A",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Material myItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x082196f3),
      borderRadius: BorderRadiusDirectional.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Material(
                      color: new Color(color),
                      borderRadius: BorderRadiusDirectional.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    DBManagerProjects.openDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results-Oriented Planning & Adaptation',
          style: TextStyle(fontSize: 17.0),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.blue])),
        ),
      ),
      drawer: _drawer(),
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
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SingUp(),
                      TextNew(),
                    ],
                  ),
                  ImageAsset(),
                  new ListTile(
                    leading: new Icon(Icons.photo_album),
                    title: new Text(
                      '                New Project',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newProject.NewProject(
                                  null, newProject.NoteMode.Adding)));
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.notifications),
                    title: new Text(
                      '                Current Projects',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  currentProjects.ProjectsHome()));
                    },
                  ),
                  // NewEmail(),
                  // PasswordInput(),
                  // ButtonNewUser(),
                  // UserOld(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.black, Colors.blue])),
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Image.asset(
                    'images/profile.jpg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  new Text(
                    'Test User',
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    'Beta',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Home'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => newProject.NewProject(
                          null, newProject.NoteMode.Adding)));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.notifications),
            title: new Text('Current Projects'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => currentProjects.ProjectsHome()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.settings),
            title: new Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileView()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Photos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          new ListTile(
            title: new Text('About us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new ListTile(
            title: new Text('Privacy'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
        AssetImage('assets/images/Results-skeleton-logo.png');
    Image image = Image(
      image: assetImage,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, bottom: 50),
      child: Container(child: image),
    );
  }
}
