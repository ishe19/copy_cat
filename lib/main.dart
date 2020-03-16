import 'package:flutter/material.dart';
import 'ui/landing_page.dart';
//import 'ui/dashboard.dart';
import 'dart:async';
// import 'package:camera/camera.dart';


// List<CameraDescription> cameras;

Future<Null> main() async {
  // cameras = await availableCameras();
  runApp(new CopyCat());
}

class CopyCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Business Manager Tool",
      home: LandingPage(),
    );
  }
}


