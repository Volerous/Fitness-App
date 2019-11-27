// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _WeightBean implements Bean<Weight> {
  final exerciseId = IntField('exercise_id');
  final id = IntField('id');
  final weight = DoubleField('weight');
  final increment = DoubleField('increment');
  final _type = StrField('_type');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        exerciseId.name: exerciseId,
        id.name: id,
        weight.name: weight,
        increment.name: increment,
        _type.name: _type,
      };
  Weight fromMap(Map map) {
    Weight model = Weight();
    model.exerciseId = adapter.parseValue(map['exercise_id']);
    model.id = adapter.parseValue(map['id']);
    model.weight = adapter.parseValue(map['weight']);
    model.increment = adapter.parseValue(map['increment']);
    model._type = adapter.parseValue(map['_type']);

    return model;
  }

  List<SetColumn> toSetColumns(Weight model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(exerciseId.set(model.exerciseId));
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(weight.set(model.weight));
      ret.add(increment.set(model.increment));
      ret.add(_type.set(model._type));
    } else if (only != null) {
      if (only.contains(exerciseId.name))
        ret.add(exerciseId.set(model.exerciseId));
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(weight.name)) ret.add(weight.set(model.weight));
      if (only.contains(increment.name))
        ret.add(increment.set(model.increment));
      if (only.contains(_type.name)) ret.add(_type.set(model._type));
    } else /* if (onlyNonNull) */ {
      if (model.exerciseId != null) {
        ret.add(exerciseId.set(model.exerciseId));
      }
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.weight != null) {
        ret.add(weight.set(model.weight));
      }
      if (model.increment != null) {
        ret.add(increment.set(model.increment));
      }
      if (model._type != null) {
        ret.add(_type.set(model._type));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(exerciseId.name,
        foreignTable: exerciseBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addDouble(weight.name, isNullable: false);
    st.addDouble(increment.name, isNullable: false);
    st.addStr(_type.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Weight model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Weight newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<Weight> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Weight model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Weight newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<Weight> models,
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

  Future<int> update(Weight model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Weight> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Weight> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Weight> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Weight> findByExercise(int exerciseId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.exerciseId.eq(exerciseId));
    return findOne(find);
  }

  Future<List<Weight>> findByExerciseList(List<Exercise> models,
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

  void associateExercise(Weight child, Exercise parent) {
    child.exerciseId = parent.id;
  }

  ExerciseBean get exerciseBean;
}

abstract class _ExerciseBean implements Bean<Exercise> {
  final name = StrField('name');
  final id = IntField('id');
  final sets = IntField('sets');
  final reps = IntField('reps');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        name.name: name,
        id.name: id,
        sets.name: sets,
        reps.name: reps,
      };
  Exercise fromMap(Map map) {
    Exercise model = Exercise();
    model.name = adapter.parseValue(map['name']);
    model.id = adapter.parseValue(map['id']);
    model.sets = adapter.parseValue(map['sets']);
    model.reps = adapter.parseValue(map['reps']);

    return model;
  }

  List<SetColumn> toSetColumns(Exercise model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(name.set(model.name));
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(sets.set(model.sets));
      ret.add(reps.set(model.reps));
    } else if (only != null) {
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(sets.name)) ret.add(sets.set(model.sets));
      if (only.contains(reps.name)) ret.add(reps.set(model.reps));
    } else /* if (onlyNonNull) */ {
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.sets != null) {
        ret.add(sets.set(model.sets));
      }
      if (model.reps != null) {
        ret.add(reps.set(model.reps));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(name.name, isNullable: false);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addInt(sets.name, isNullable: false);
    st.addInt(reps.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Exercise model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Exercise newModel;
      if (model.weight != null) {
        newModel ??= await find(retId);
        weightBean.associateExercise(model.weight, newModel);
        await weightBean.insert(model.weight, cascade: cascade);
      }
      if (model.workouts != null) {
        newModel ??= await find(retId);
        for (final child in model.workouts) {
          await workoutBean.insert(child, cascade: cascade);
          await workoutExercisePivotBean.attach(child, newModel);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Exercise> models,
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

  Future<dynamic> upsert(Exercise model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Exercise newModel;
      if (model.weight != null) {
        newModel ??= await find(retId);
        weightBean.associateExercise(model.weight, newModel);
        await weightBean.upsert(model.weight, cascade: cascade);
      }
      if (model.workouts != null) {
        newModel ??= await find(retId);
        for (final child in model.workouts) {
          await workoutBean.upsert(child, cascade: cascade);
          await workoutExercisePivotBean.attach(child, newModel, upsert: true);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Exercise> models,
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

  Future<int> update(Exercise model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Exercise newModel;
      if (model.weight != null) {
        if (associate) {
          newModel ??= await find(model.id);
          weightBean.associateExercise(model.weight, newModel);
        }
        await weightBean.update(model.weight,
            cascade: cascade, associate: associate);
      }
      if (model.workouts != null) {
        for (final child in model.workouts) {
          await workoutBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Exercise> models,
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
        where.add(this.id.eq(model.id));
      }
      final UpdateMany update = updaters.addAll(data, where);
      await adapter.updateMany(update);
      return;
    }
  }

  Future<Exercise> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Exercise model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final Exercise newModel = await find(id);
      if (newModel != null) {
        await weightBean.removeByExercise(newModel.id);
        await workoutExercisePivotBean.detachExercise(newModel);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Exercise> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Exercise> preload(Exercise model, {bool cascade = false}) async {
    model.weight = await weightBean.findByExercise(model.id,
        preload: cascade, cascade: cascade);
    model.workouts = await workoutExercisePivotBean.fetchByExercise(model);
    return model;
  }

  Future<List<Exercise>> preloadAll(List<Exercise> models,
      {bool cascade = false}) async {
    await OneToXHelper.preloadAll<Exercise, Weight>(
        models,
        (Exercise model) => [model.id],
        weightBean.findByExerciseList,
        (Weight model) => [model.exerciseId],
        (Exercise model, Weight child) => model.weight = child,
        cascade: cascade);
    for (Exercise model in models) {
      var temp = await workoutExercisePivotBean.fetchByExercise(model);
      if (model.workouts == null)
        model.workouts = temp;
      else {
        model.workouts.clear();
        model.workouts.addAll(temp);
      }
    }
    return models;
  }

  WeightBean get weightBean;
  WorkoutExercisePivotBean get workoutExercisePivotBean;

  WorkoutBean get workoutBean;
}
