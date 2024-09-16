import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:prelim_project/global_providers.dart';

void main() {
  final container = ProviderContainer();
  final workoutService = container.read(workoutServiceProvider);

  while (true) {
    print('\nWorkout Planner');
    print('1. Add a workout');
    print('2. View all workouts');
    print('3. Add an exercise to a workout');
    print('4. View exercises in a workout');
    print('5. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the workout name:');
        String? name = stdin.readLineSync();
        if (name != null && name.isNotEmpty) {
          workoutService.addWorkout(name);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '2':
        workoutService.viewWorkouts();
        break;

      case '3':
        print('Enter the workout name:');
        String? workoutName = stdin.readLineSync();
        print('Enter the exercise name:');
        String? exerciseName = stdin.readLineSync();
        print('Enter the number of sets:');
        int? sets = int.tryParse(stdin.readLineSync() ?? '');
        print('Enter the number of reps per set:');
        int? reps = int.tryParse(stdin.readLineSync() ?? '');
        if (workoutName != null && exerciseName != null && sets != null && reps != null) {
          workoutService.addExerciseToWorkout(workoutName, exerciseName, sets, reps);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '4':
        print('Enter the workout name:');
        String? workoutName = stdin.readLineSync();
        if (workoutName != null && workoutName.isNotEmpty) {
          workoutService.viewExercises(workoutName);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '5':
        print('Exiting the application...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}