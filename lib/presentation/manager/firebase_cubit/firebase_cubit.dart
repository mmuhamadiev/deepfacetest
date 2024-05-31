import 'package:bloc/bloc.dart';
import 'package:deepface_test/data/remote/firebase/firebase_helper.dart';
import 'package:meta/meta.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseState());

  Future<void> saveNewTask(
      String taskId,
      String status
      ) async{

    try {
      var id = await FirebaseHelper.saveTask(
        taskId,
        DateTime.now(),
        status,
      );
      emit(FirebaseSavedNewTaskState());
    } catch(e) {
      emit(FirebaseErrorState(e.toString()));
    }

  }

  Future<void> deleteFirebaseTaskHistory(String docId, String status) async{
    try {
      final response = await FirebaseHelper.deleteTask(docId);
      emit(FirebaseDeleteTaskState());
    } catch(e) {
      emit(FirebaseErrorState(e.toString()));
    }
  }

  Future<void> updateRacion(
      String docId,
      String status
      ) async{
    try {
      emit(FirebaseLoadingTaskState());
      var id = await FirebaseHelper.updateTask(
          docId,
          status
      );
      emit(FirebaseUpdatedTaskState());
    } catch(e) {
      emit(FirebaseErrorState(e.toString()));
    }
  }
}
