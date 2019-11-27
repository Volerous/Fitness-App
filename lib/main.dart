import 'package:fitness_app/Repo.dart';
import 'package:fitness_app/elements/buttons.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/workout.dart';
import 'package:flutter/material.dart';
// import 'Repo.dart';

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
  // _MyHomePageState() {
  //   print("running");
  //   this.repo = new Repo();
  //   this.repo.initDone.then((i) {
  //     print("test");
  //   });
  // }
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

    this.repo.getAllWorkouts().then((wos) {
      print(wos[0]);
    });
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
              CircleButton(text: "test"),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {
                        if (val == "1") {
                          return null;
                        }
                        return "Empty String";
                      },
                      onSaved: (val) {
                        print(val);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: RaisedButton(
                        child: Text('submit'),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            var val = _formKey.currentState;
                            print(val.toString());
                            _formKey.currentState.save();
                          } else {
                            print("error found");
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  title: Text("test"), icon: Icon(Icons.today)),
              new BottomNavigationBarItem(
                  title: Text("test2"), icon: Icon(Icons.today)),
            ],
            onTap: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
          ),
        );
      },
    );
  }
}