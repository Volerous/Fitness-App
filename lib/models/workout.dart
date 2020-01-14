import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';
import './exercise.dart';
part 'workout.jorm.dart';

class Workout {
  @PrimaryKey()
  String name;
  @ManyToMany(WorkoutExercisePivotBean, ExerciseBean)
  List<Exercise> exercises;
  @PrimaryKey()
  String rotation;
  Workout({this.name, this.exercises, this.rotation});
  String toString() => "Workout($name, $rotation, $exercises)";
  int compareForSort(Workout b) {
    if (this.name == b.name) {
      return this.rotation.compareTo(b.rotation);
    } else {
      return this.name.toLowerCase().compareTo(b.name.toLowerCase());
    }
  }
}

class WorkoutExercisePivot {
  @BelongsTo.many(WorkoutBean, refCol: "name")
  String workoutName;
  @BelongsTo.many(WorkoutBean, refCol: "rotation")
  String rotation;
  @BelongsTo.many(ExerciseBean)
  int exerciseId;
}

@GenBean()
class WorkoutBean extends Bean<Workout> with _WorkoutBean {
  WorkoutExercisePivotBean _workoutExercisePivotBean;
  ExerciseBean _exerciseBean;
  WorkoutBean(Adapter adapter) : super(adapter);

  WorkoutExercisePivotBean get workoutExercisePivotBean {
    _workoutExercisePivotBean ??= new WorkoutExercisePivotBean(adapter);
    return _workoutExercisePivotBean;
  }

  ExerciseBean get exerciseBean {
    _exerciseBean ??= new ExerciseBean(adapter);
    return _exerciseBean;
  }

  final String tableName = "workout";
}

@GenBean()
class WorkoutExercisePivotBean extends Bean<WorkoutExercisePivot>
    with _WorkoutExercisePivotBean {
  WorkoutBean _workoutBean;
  ExerciseBean _exerciseBean;
  WorkoutBean get workoutBean {
    _workoutBean ??= new WorkoutBean(adapter);
    return _workoutBean;
  }

  ExerciseBean get exerciseBean {
    _exerciseBean ??= new ExerciseBean(adapter);
    return _exerciseBean;
  }

  WorkoutExercisePivotBean(Adapter adapter) : super(adapter);
  final String tableName = "WorkoutExercisePivot";
}
