import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import './models/exercise.dart';
import 'package:fitness_app/models/workout.dart';
class Repo {
  ExerciseBean _exerciseBean;
  WorkoutBean _workoutBean;
  SqfliteAdapter _sqfliteAdapter;
  Future<void> _initDone;

  Repo() {
    print("1");
    _initDone = this._init();
  }
  Future<void> get initDone => _initDone;
  Future<void> _init() async {
    var dbpath = await getDatabasesPath();
    this._sqfliteAdapter = new SqfliteAdapter(path.join(dbpath, "fitness.db"));
    await _sqfliteAdapter.connect();
    this._exerciseBean = new ExerciseBean(_sqfliteAdapter);
    this._workoutBean = new WorkoutBean(_sqfliteAdapter);
    await _exerciseBean.createTable(ifNotExists: true);
    print(this._workoutBean);
    await _workoutBean.createTable(ifNotExists: true);
  }
  // Workout functions
  Future<List<Workout>> getAllWorkouts() async => _workoutBean.getAll();
  Future<Workout> getWorkout(String name, String rotation) async {    
    return _workoutBean.find(name,rotation);
  }
  Future<List<Workout>> getWorkoutByName(String name) async {
    return _workoutBean.findWhere(eq('name', name));
  }
  Future<dynamic> createWorkout(Workout workout) async {
    print(this._workoutBean);
    print(workout);
    return this._workoutBean.upsert(workout);
  }
  Future<int> deleteWorkout(String name, String rotation) async {
    return _workoutBean.remove(name, rotation);
  }
  // Future<Workout> updateWorkout() => (); 
}