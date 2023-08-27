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

  static Future<UserModel> getUserData(String uid) async {
    final collectionRef = firestore.collection(_userData);
    final query = collectionRef
        .where('reference', isEqualTo: uid)
        .where('answered', isEqualTo: false);

    final result = await query.get();
    final user = result.docs.map((doc) {
      final map = doc.data();
      return UserModel.fromMap(map);
    }).toList();
    return user[0];
  }

  static Future<UserModel?> updateUserAlreadyAnswer(UserModel user) async {
    try {
      final docRef = firestore.collection(_userData).doc(user.reference);
      await docRef.set(user.toMap());
      return user;
    } catch (_) {
      rethrow;
    }
  }
}
