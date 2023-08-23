import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/user_model.dart';
import 'package:get/get.dart';

class UserRepository {
  static const String _userData = 'user';

  static Future<void> createSurvey(UserModel userModel) async {
    try {
      final docRef = firestore.collection(_userData).doc(userModel.uid);
      await docRef.set(userModel.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserModel?> getSurvey(String uid) async {
    try {
      final docRef = firestore.collection(_userData).doc(uid);
      final doc = await docRef.get();

      if (!doc.exists) {
        return null;
      }

      final map = doc.data() as Map<String, dynamic>;
      final feedback = UserModel.fromMap(map);
      return feedback;
    } catch (_) {
      rethrow;
    }
  }
}
