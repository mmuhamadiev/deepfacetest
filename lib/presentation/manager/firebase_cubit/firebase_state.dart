part of 'firebase_cubit.dart';

class FirebaseState {}
class FirebaseSavedNewTaskState extends FirebaseState {}
class FirebaseUpdatedTaskState extends FirebaseState {}
class FirebaseDeleteTaskState extends FirebaseState {}
class FirebaseLoadingTaskState extends FirebaseState {}
class FirebaseErrorState extends FirebaseState {
  String message;
  FirebaseErrorState(this.message);
}
