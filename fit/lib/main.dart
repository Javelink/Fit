import 'package:flutter/material.dart';
import 'screens/landing.dart';

void main() => runApp(Fit());

class Fit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fit",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ),
      home: LandingPage()
    );
  }
}
