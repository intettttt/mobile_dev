class Workout {
  String name;
  List<Exercise> exercises = [];

  Workout(this.name);

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
    print('${exercise.name} has been added to $name.');
  }

  @override
  String toString() => name;
}

class Exercise {
  String name;
  int sets;
  int reps;

  Exercise(this.name, this.sets, this.reps);

  @override
  String toString() => '$name: $sets sets of $reps reps';
}