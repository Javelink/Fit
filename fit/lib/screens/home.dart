import 'package:fit/services/auth.dart';
import 'package:flutter/material.dart';
import '../domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("Fit"),
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
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(title: 'test', author: 'test', description: 'test', level: 'easy'),
    Workout(
        title: 'test1', author: 'test1', description: 'test1', level: 'medium'),
    Workout(
        title: 'test2', author: 'test2', description: 'test2', level: 'hard')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                leading: Container(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.fitness_center,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.white24))),
                ),
                title: Text(
                  workouts[index].title,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.title.color,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                subtitle: subtitle(context, workouts[index]),
              ),
            ),
          );
        },
      ),
    ));
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
