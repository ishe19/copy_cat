import 'package:flutter/material.dart';
import 'ui/landing_page.dart';
import 'ui/dashboard.dart';

void main() => runApp(CopyCat());

class CopyCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Business Manager Copy",
      home: Dashboard(),
    );
  }
}


