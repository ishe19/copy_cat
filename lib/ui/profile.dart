import 'package:flutter/material.dart';


class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator()
        ],
      ),
      ),
    );
  }
}
