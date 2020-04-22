import 'package:flutter/material.dart';

class TextNew extends StatefulWidget {
  @override
  _TextNewState createState() => _TextNewState();
}

class _TextNewState extends State<TextNew> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0,bottom: 20.0),
      child: Container(
        //color: Colors.green,
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 1,
            ),
            Center(
              child: Text(
                'Plan.            Do.        Check.     Adapt.',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}