import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fit/components/active-workout.dart';
import 'package:fit/components/worlout-list.dart';
import 'package:fit/services/auth.dart';
import 'package:flutter/material.dart';
import '../domain/workout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionInteger = 0;
  @override
  Widget build(BuildContext context) {
    var curvedNavigationBar = CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.fitness_center, size: 30),
        Icon(Icons.search, size: 30),
      ],
      index: 0,
      height: 60,
      color: Colors.white.withOpacity(0.5),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.5),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (int index) {
        setState(() => sectionInteger = index);
      },
    );

    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            sectionInteger == 0 ? "Active Workout" : "Find Workouts"
          ),
          leading: Icon(Icons.fitness_center),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                AuthService().logOut();
              },
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink()
            )
          ],
        ),
        body: sectionInteger == 0 ? ActiveWorkout() : WorkoutsList(),
        bottomNavigationBar: curvedNavigationBar
      )
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'easy':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'medium':
      color = Colors.orange;
      indicatorLevel = 0.66;
      break;
    case 'hard':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        child: Text(workout.level,
            style: TextStyle(color: Theme.of(context).textTheme.title.color)),
      )
    ],
  );
}
