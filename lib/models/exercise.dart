import 'package:fitness_app/models/workout.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
part 'exercise.jorm.dart';

class Exercise {
  String name;
  @PrimaryKey(auto: true)
  int id;
  @HasOne(WeightBean)
  Weight weight;
  @ManyToMany(WorkoutExercisePivotBean, WorkoutBean)
  List<Workout> workouts;
  int sets = 1;
  int reps = 1;
  @IgnoreColumn()
  List<bool> completed;
  Exercise(
      {this.name, this.id, this.weight, this.workouts, this.reps, this.sets})
      : this.completed = new List<bool>(sets);
}

class Weight {
  @IgnoreColumn()
  final String measurement = "kg";
  @BelongsTo(ExerciseBean)
  int exerciseId;
  @PrimaryKey(auto: true)
  int id;
  double weight;
  double increment;
  String _type;
  Weight({this.exerciseId, this.weight, this.increment, String type})
      : _type = type;
  @IgnoreColumn()
  WeightType get type {
    return WeightType.findFromString(_type);
  }
  num get weightPerSide {
    return this.weight/2; 
  }
}

class WeightType {
  final _string;
  final _index;
  const WeightType._internal(this._string, this._index);
  toString() => "$_string";
  get value => _index;
  static List<WeightType> values() => [BARBELL, FREE, MACHINE];
  static const BARBELL = WeightType._internal("Barbell Side", 0);
  static const FREE = WeightType._internal("Free", 1);
  static const MACHINE = WeightType._internal("Machine", 2);
  static findFromString(String abbreviation) {
    return values().firstWhere((level) => abbreviation == level._string);
  }
}

@GenBean()
class WeightBean extends Bean<Weight> with _WeightBean {
  WeightBean(Adapter adapter) : super(adapter);
  final String tableName = "weight";
  ExerciseBean _exerciseBean;
  ExerciseBean get exerciseBean => _exerciseBean ??= new ExerciseBean(adapter);
}

@GenBean()
class ExerciseBean extends Bean<Exercise> with _ExerciseBean {
  WeightBean _weightBean;
  WorkoutExercisePivotBean _workoutExercisePivotBean;
  WorkoutBean _workoutBean;
  ExerciseBean(Adapter adapter)
      : super(adapter);
  WorkoutBean get workoutBean {
    _workoutBean ??= new WorkoutBean(adapter);
    return _workoutBean;
  }

  WeightBean get weightBean {
    _weightBean ??= new WeightBean(adapter);
    return _weightBean;
  }

  WorkoutExercisePivotBean get workoutExercisePivotBean {
    _workoutExercisePivotBean ??= new WorkoutExercisePivotBean(adapter);
    return _workoutExercisePivotBean;
  }
  final String tableName = "exercise";
}
