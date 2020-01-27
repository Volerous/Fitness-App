import 'package:fitness_app/Repo.dart';
import 'package:fitness_app/elements/buttons.dart';
import 'package:fitness_app/elements/forms.dart';
import 'package:fitness_app/elements/lists.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:flutter/material.dart';
import "elements/forms.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Workout App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Repo repo;
  int _currentIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print(this.repo);
    super.initState();
    this.repo = new Repo();
    this.repo.initDone.then((i) {
      setState(() {
        return i;
      });
    });
  }

  void test() {
    var newworkout = new Workout()
      ..exercises = List<Exercise>()
      ..name = "Test New Workout"
      ..rotation = "A";
  }

  Function setCurrentIndex(int idx) {
    void setIndexFunction() {
      return setState(() {
        _currentIndex = idx;
      });
    }

    return setIndexFunction;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: this.repo.initDone,
      builder: (context, snapshot) {
        test();
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: <Widget>[
              // Text("Test"),
              // WorkoutList(workouts: repo.getAllWorkouts()),
              MetricDropDown(),
              Center(
                child: RaisedButton(
                  child: Text("add new Exercise"),
                  onPressed: () {
                    repo.addTestWorkout();
                  },
                ),
              ),
              WorkoutForm(formKey: _formKey, workout: new Workout()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.today,
                  color: Colors.black,
                ),
                title: Text(
                  "Test",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.today,
                  color: Colors.black,
                ),
                title: Text(
                  "Test",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.today,
                  color: Colors.black,
                ),
                title: Text(
                  "Test",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: _onBotNavTapped,
          ),
        );
      },
    );
  }

  void _onBotNavTapped(int idx) {
    setState(() {
      _currentIndex = idx;
    });
  }
}
