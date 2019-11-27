// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _WorkoutBean implements Bean<Workout> {
  final name = StrField('name');
  final rotation = StrField('rotation');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        name.name: name,
        rotation.name: rotation,
      };
  Workout fromMap(Map map) {
    Workout model = Workout();
    model.name = adapter.parseValue(map['name']);
    model.rotation = adapter.parseValue(map['rotation']);

    return model;
  }

  List<SetColumn> toSetColumns(Workout model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(name.set(model.name));
      ret.add(rotation.set(model.rotation));
    } else if (only != null) {
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(rotation.name)) ret.add(rotation.set(model.rotation));
    } else /* if (onlyNonNull) */ {
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.rotation != null) {
        ret.add(rotation.set(model.rotation));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(name.name, primary: true, isNullable: false);
    st.addStr(rotation.name, primary: true, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Workout model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      Workout newModel;
      if (model.exercises != null) {
        newModel ??= await find(model.name, model.rotation);
        for (final child in model.exercises) {
          await exerciseBean.insert(child, cascade: cascade);
          await workoutExercisePivotBean.attach(newModel, child);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Workout> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(Workout model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Workout newModel;
      if (model.exercises != null) {
        newModel ??= await find(model.name, model.rotation);
        for (final child in model.exercises) {
          await exerciseBean.upsert(child, cascade: cascade);
          await workoutExercisePivotBean.attach(newModel, child, upsert: true);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Workout> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      }
      final UpsertMany upsert = upserters.addAll(data);
      await adapter.upsertMany(upsert);
      return;
    }
  }

  Future<int> update(Workout model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.name.eq(model.name))
        .where(this.rotation.eq(model.rotation))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Workout newModel;
      if (model.exercises != null) {
        for (final child in model.exercises) {
          await exerciseBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Workout> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      final List<Expression> where = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
        where.add(
            this.name.eq(model.name).and(this.rotation.eq(model.rotation)));
      }
      final UpdateMany update = updaters.addAll(data, where);
      await adapter.updateMany(update);
      return;
    }
  }

  Future<Workout> find(String name, String rotation,
      {bool preload = false, bool cascade = false}) async {
    final Find find =
        finder.where(this.name.eq(name)).where(this.rotation.eq(rotation));
    final Workout model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(String name, String rotation,
      {bool cascade = false}) async {
    if (cascade) {
      final Workout newModel = await find(name, rotation);
      if (newModel != null) {
        await workoutExercisePivotBean.detachWorkout(newModel);
      }
    }
    final Remove remove =
        remover.where(this.name.eq(name)).where(this.rotation.eq(rotation));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Workout> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.name.eq(model.name) | this.rotation.eq(model.rotation));
    }
    return adapter.remove(remove);
  }

  Future<Workout> preload(Workout model, {bool cascade = false}) async {
    model.exercises = await workoutExercisePivotBean.fetchByWorkout(model);
    return model;
  }

  Future<List<Workout>> preloadAll(List<Workout> models,
      {bool cascade = false}) async {
    for (Workout model in models) {
      var temp = await workoutExercisePivotBean.fetchByWorkout(model);
      if (model.exercises == null)
        model.exercises = temp;
      else {
        model.exercises.clear();
        model.exercises.addAll(temp);
      }
    }
    return models;
  }

  WorkoutExercisePivotBean get workoutExercisePivotBean;

  ExerciseBean get exerciseBean;
}

abstract class _WorkoutExercisePivotBean implements Bean<WorkoutExercisePivot> {
  final workoutName = StrField('workout_name');
  final rotation = StrField('rotation');
  final exerciseId = IntField('exercise_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        workoutName.name: workoutName,
        rotation.name: rotation,
        exerciseId.name: exerciseId,
      };
  WorkoutExercisePivot fromMap(Map map) {
    WorkoutExercisePivot model = WorkoutExercisePivot();
    model.workoutName = adapter.parseValue(map['workout_name']);
    model.rotation = adapter.parseValue(map['rotation']);
    model.exerciseId = adapter.parseValue(map['exercise_id']);

    return model;
  }

  List<SetColumn> toSetColumns(WorkoutExercisePivot model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(workoutName.set(model.workoutName));
      ret.add(rotation.set(model.rotation));
      ret.add(exerciseId.set(model.exerciseId));
    } else if (only != null) {
      if (only.contains(workoutName.name))
        ret.add(workoutName.set(model.workoutName));
      if (only.contains(rotation.name)) ret.add(rotation.set(model.rotation));
      if (only.contains(exerciseId.name))
        ret.add(exerciseId.set(model.exerciseId));
    } else /* if (onlyNonNull) */ {
      if (model.workoutName != null) {
        ret.add(workoutName.set(model.workoutName));
      }
      if (model.rotation != null) {
        ret.add(rotation.set(model.rotation));
      }
      if (model.exerciseId != null) {
        ret.add(exerciseId.set(model.exerciseId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(workoutName.name,
        foreignTable: workoutBean.tableName,
        foreignCol: 'name',
        isNullable: false);
    st.addStr(rotation.name,
        foreignTable: workoutBean.tableName,
        foreignCol: 'rotation',
        isNullable: false);
    st.addInt(exerciseId.name,
        foreignTable: exerciseBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(WorkoutExercisePivot model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<WorkoutExercisePivot> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(WorkoutExercisePivot model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<WorkoutExercisePivot> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<void> updateMany(List<WorkoutExercisePivot> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(null);
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<List<WorkoutExercisePivot>> findByWorkout(
      String workoutName, String rotation,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder
        .where(this.workoutName.eq(workoutName))
        .where(this.rotation.eq(rotation));
    return findMany(find);
  }

  Future<List<WorkoutExercisePivot>> findByWorkoutList(List<Workout> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Workout model in models) {
      find.or(
          this.workoutName.eq(model.name) & this.rotation.eq(model.rotation));
    }
    return findMany(find);
  }

  Future<int> removeByWorkout(String workoutName, String rotation) async {
    final Remove rm = remover
        .where(this.workoutName.eq(workoutName))
        .where(this.rotation.eq(rotation));
    return await adapter.remove(rm);
  }

  void associateWorkout(WorkoutExercisePivot child, Workout parent) {
    child.workoutName = parent.name;
    child.rotation = parent.rotation;
  }

  Future<int> detachWorkout(Workout model) async {
    final dels = await findByWorkout(model.name, model.rotation);
    if (dels.isNotEmpty) {
      await removeByWorkout(model.name, model.rotation);
      final exp = Or();
      for (final t in dels) {
        exp.or(exerciseBean.id.eq(t.exerciseId));
      }
      return await exerciseBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Exercise>> fetchByWorkout(Workout model) async {
    final pivots = await findByWorkout(model.name, model.rotation);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(exerciseBean.id.eq(t.exerciseId));
    }
    return await exerciseBean.findWhere(exp);
  }

  Future<List<WorkoutExercisePivot>> findByExercise(int exerciseId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.exerciseId.eq(exerciseId));
    return findMany(find);
  }

  Future<List<WorkoutExercisePivot>> findByExerciseList(List<Exercise> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Exercise model in models) {
      find.or(this.exerciseId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByExercise(int exerciseId) async {
    final Remove rm = remover.where(this.exerciseId.eq(exerciseId));
    return await adapter.remove(rm);
  }

  void associateExercise(WorkoutExercisePivot child, Exercise parent) {
    child.exerciseId = parent.id;
  }

  Future<int> detachExercise(Exercise model) async {
    final dels = await findByExercise(model.id);
    if (dels.isNotEmpty) {
      await removeByExercise(model.id);
      final exp = Or();
      for (final t in dels) {
        exp.or(workoutBean.name.eq(t.workoutName) &
            workoutBean.rotation.eq(t.rotation));
      }
      return await workoutBean.removeWhere(exp);
    }
    return 0;
  }

  Future<List<Workout>> fetchByExercise(Exercise model) async {
    final pivots = await findByExercise(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];
    final exp = Or();
    for (final t in pivots) {
      exp.or(workoutBean.name.eq(t.workoutName) &
          workoutBean.rotation.eq(t.rotation));
    }
    return await workoutBean.findWhere(exp);
  }

  Future<dynamic> attach(Workout one, Exercise two,
      {bool upsert = false}) async {
    final ret = WorkoutExercisePivot();
    ret.workoutName = one.name;
    ret.rotation = one.rotation;
    ret.exerciseId = two.id;
    if (!upsert) {
      return insert(ret);
    } else {
      return this.upsert(ret);
    }
  }

  WorkoutBean get workoutBean;
  ExerciseBean get exerciseBean;
}
