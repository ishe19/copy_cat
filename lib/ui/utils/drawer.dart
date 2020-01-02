import 'package:copy_cat/ui/profile.dart';
import 'package:flutter/material.dart';
import 'uidata.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  var _navBarKey = GlobalKey<DrawerControllerState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _navBarKey,
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          //USER AVATAR AND INFORMATION
          Container(
            height: 175.0,
            color: Color.fromRGBO(214, 204, 204, 100),
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: Text("Email"),
                  accountName: Text("Username"),
//                  accountName: Text("UserName"),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Uidata.primaryColor
                  ),
                )
              ],
            ),

          ),

          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  //Settings
                  title: Text("Profile"),
                  leading: Icon(Icons.person, color: Uidata.primaryColor,),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
                  },
                ),
                Divider(),

                ListTile(
                  //Settings
                  title: Text("Exit"),
                  leading: Icon(Icons.exit_to_app, color: Uidata.primaryColor,),
                  onTap: () {
                  },

                ),
              ],
            ),
          )
        ],
      ),
    );;
  }
}
