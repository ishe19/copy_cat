import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Padding(
      padding: const EdgeInsets.only(top: 5, left: 50,bottom: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child:  Row(
                  children: <Widget>[
                    RedDot(),
            Text(
            'ROPA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 80,
              fontWeight: FontWeight.w900,
            ),
          ),
          BlackDot(),
                  ]
      )
      ),
    ),
    );
  }
}

class RedDot extends StatelessWidget{
  @override 

 
  Widget build(BuildContext context){
    return Icon(Icons.brightness_1,
      color: Colors.red,
      size: 50);
  }
}

class BlackDot extends StatelessWidget{
  @override 

  Widget build(BuildContext context){
    return Icon(Icons.brightness_1,
      color: Colors.black,
      size: 50);
  }
}


