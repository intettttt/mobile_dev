import 'package:riverpod/riverpod.dart';
import 'package:collection/collection.dart';  // Import collection package for firstWhereOrNull
import 'package:prelim_project/model/workout.dart';

class WorkoutService {
  final Ref container;
  final List<Workout> _workouts = [];

  WorkoutService(this.container);

  void addWorkout(String name) {
    final newWorkout = Workout(name);
    _workouts.add(newWorkout);
    print('$name workout has been added.');
  }

  void addExerciseToWorkout(String workoutName, String exerciseName, int sets, int reps) {
    // Use firstWhereOrNull to avoid the null error
    final workout = _workouts.firstWhereOrNull(
      (workout) => workout.name == workoutName,
    );

    if (workout != null) {
      final exercise = Exercise(exerciseName, sets, reps);
      workout.addExercise(exercise);
    } else {
      print('Workout not found.');
    }
  }

  void viewWorkouts() {
    if (_workouts.isEmpty) {
      print('No workouts available.');
    } else {
      print('Workouts:');
      for (var workout in _workouts) {
        print(workout);
      }
    }
  }

 void viewExercises(String workoutName) {
  // Debugging: Print the workout name and the current list of workouts
  print('Searching for workout: ${workoutName.trim().toLowerCase()}');
  print('Available workouts: $_workouts');

  final workout = _workouts.firstWhereOrNull(
    (workout) => workout.name.trim().toLowerCase() == workoutName.trim().toLowerCase(),
  );

  if (workout != null) {
    if (workout.exercises.isEmpty) {
      print('No exercises in ${workout.name}.');
    } else {
      print('Exercises in ${workout.name}:');
      for (var exercise in workout.exercises) {
        print(exercise);
      }
    }
  } else {
    print('Workout not found.');
  }
}
}