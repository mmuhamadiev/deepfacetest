import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deepface_test/presentation/manager/locator.dart';

class FirebaseHelper {

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<String> saveTask(
    String taskId,
    DateTime createdAt,
    String status
  ) async{

    Map<String, dynamic> tasks = {
      'task_id': taskId,
      'created_at': createdAt,
      'status': status,
    };

    DocumentReference docRef = _db.collection('task_database').doc();
    await docRef.set(tasks);
    return docRef.id; // Return the auto-generated ID
  }


  static Future<String> updateTask(
      String docId,
      String status
      ) async{

    Map<String, dynamic> tasks = {
      'status': status,
    };

    DocumentReference docRef = _db.collection('task_database').doc(docId);

    await docRef.update(tasks);
    return docRef.id;
  }

  static Future<bool> deleteTask( String docId) async{
      final clientsRef = _db.collection('task_database').doc(docId);
      if((await clientsRef.get()).exists) {
        await clientsRef.delete();
        return true;
      }
      else{
        logger.e('id is not exist');
        return false;
      }
  }
}