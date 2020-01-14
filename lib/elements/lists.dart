import "package:flutter/material.dart";
import '../models/workout.dart';

class WorkoutList extends StatelessWidget {
  WorkoutList({this.workouts});
  final Future<List<Workout>> workouts;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: workouts,
        builder: (BuildContext ctx, AsyncSnapshot<List<Workout>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            snapshot.data.sort((Workout a, Workout b) => a.compareForSort(b));
            return ListView.separated(
              separatorBuilder: (BuildContext ctx1, int idx) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext ctx1, int idx) {
                return ListTile(
                  title: Text(snapshot.data[idx].name),
                  subtitle: Text(snapshot.data[idx].rotation),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
