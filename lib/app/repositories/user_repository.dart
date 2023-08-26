import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/user_model.dart';

class UserRepository {
  static const String _userData = 'user';

  static Future<UserModel> createUserToSurvey(UserModel userModel) async {
    try {
      final docRef = firestore.collection(_userData).doc();
      final userData = UserModel(
          answered: userModel.answered,
          contact: userModel.contact,
          createdAt: userModel.createdAt,
          name: userModel.name,
          reference: docRef.id,
          service: userModel.service,
          uid: userModel.uid,
          updatedAt: userModel.updatedAt,
          userType: userModel.userType);
      await docRef.set(userData.toMap());
      return userData;
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
