import 'package:riverpod/riverpod.dart';
import 'package:prelim_project/service/workout_service.dart';

final workoutServiceProvider = Provider((ref) => WorkoutService(ref));