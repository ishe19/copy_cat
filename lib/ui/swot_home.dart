import 'package:flutter/material.dart';

class SWOTHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text("SWOT"),
          ],
        )
      ),
    );
  }
}
