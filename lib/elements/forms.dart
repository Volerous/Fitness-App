import 'package:fitness_app/models/exercise.dart';
import "package:flutter/material.dart";
import '../models/workout.dart';

class WorkoutForm extends StatefulWidget {
  WorkoutForm({this.formKey, this.workout});
  final GlobalKey<FormState> formKey;
  final Workout workout;
  @override
  _WorkoutFormState createState() =>
      _WorkoutFormState(formKey: this.formKey, workout: this.workout);
}

class _WorkoutFormState extends State<WorkoutForm> {
  _WorkoutFormState({this.formKey, this.workout});
  final GlobalKey<FormState> formKey;
  Workout workout;
  List<Widget> exerciseForms = [];
  List<Exercise> exercises = [];
  
  void addNewExercise() {
    var newEx = new Exercise(
        name: "Exercise 1",
        sets: 3,
        reps: 12,
        workouts: new List<Workout>(),
        weight: new Weight(
            increment: 2.5, type: WeightType.BARBELL.toString(), weight: 0.0));
    this.exercises.add(newEx);
    var index = this.exercises.length - 1;
    this.exerciseForms.add(
          Column(
            children: <Widget>[
              Text("Exercise ${index + 1}"),
              TextFormField(
                decoration: InputDecoration(hintText: "Name"),
                validator: (val) {
                  if (val == "1") {
                    return null;
                  }
                  return "Incorrect Name";
                },
                onSaved: (val) {
                  this.exercises[index].name = val;
                },
              ),
              TextFormField(decoration: InputDecoration(hintText: "weight"),)
            ],
          ),
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: <Widget>[
          ...exerciseForms,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Add Exercise'),
                  onPressed: () {
                    this.addNewExercise();
                  },
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      var val = formKey.currentState;
                      print(val.toString());
                      formKey.currentState.save();
                    } else {
                      print("error found");
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
