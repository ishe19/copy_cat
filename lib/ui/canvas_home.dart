import 'package:flutter/material.dart';
import 'utils/uidata.dart';


class CanvasHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            canvasCard(),
          ],
        )
      ),
    );
  }
}

// This will be the card that will be generated every time the user taps the floating action button
// and enters their canvas name.

Widget canvasCard(){
  return Padding(
    padding: const EdgeInsets.all(10),
    child:Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
         child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Model Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
              ],
            ),
            Row(
              children: <Widget>[
                Text("Description of model canvas")
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
  //                splashColor: Colors.grey,
                  color: Colors.white,
                  child: Text("EDIT MODEL", style: TextStyle(color: Uidata.primaryColor),),
                  onPressed: (){
  
                  },
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text("DETAILS", style: TextStyle(color: Uidata.primaryColor),),
                  onPressed: (){
  
                  },
                ),
              ],
            )
          ],
        ),
      ),
    )
    )
  );
}