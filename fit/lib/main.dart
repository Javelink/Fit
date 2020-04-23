import 'package:fit/domain/user.dart';
import 'package:fit/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/landing.dart';

void main() => runApp(Fit());

class Fit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fit",
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))
        ),
        home: LandingPage()
      ),
    );
  }
}
