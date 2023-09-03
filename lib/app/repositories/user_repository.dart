import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/user_admin_office_model.dart';
import 'package:css/app/models/user_cashier_model.dart';
import 'package:css/app/models/user_library_model.dart';
import 'package:css/app/models/user_model.dart';
import 'package:css/app/models/user_registrar_model.dart';
import 'package:css/app/models/user_security_office_model.dart';

class UserRepository {
  static const String _userLibrary = 'userLibrary';
  static const String _userAdminsOffice = 'userAdminsOffice';
  static const String _userCashier = 'userCashier';
  static const String _userRegistrar = 'userRegistrar';
  static const String _userSecurityOffice = 'userSecurityOffice';
  static const String _userData = 'user';

//**Create User for Each Office */

  static Future<UserLibraryModel> createUserLibraryToSurvey(
      UserLibraryModel userModel) async {
    try {
      final docRef = firestore.collection(_userLibrary).doc();
      final userData = UserLibraryModel(
        uid: docRef.id,
        name: userModel.name,
        contact: userModel.contact,
        course: userModel.course,
        gender: userModel.gender,
        userType: userModel.userType,
        answered: userModel.answered,
        version: userModel.version,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
      );
      await docRef.set(userData.toMap());
      return userData;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserAdminOfficeModel> createUserAdminOfficeToSurvey(
      UserAdminOfficeModel userModel) async {
    try {
      final docRef = firestore.collection(_userAdminsOffice).doc();
      final userData = UserAdminOfficeModel(
        uid: docRef.id,
        name: userModel.name,
        course: userModel.course,
        yearLevel: userModel.yearLevel,
        userType: userModel.userType,
        answered: userModel.answered,
        version: userModel.version,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
      );
      await docRef.set(userData.toMap());
      return userData;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserCashierModel> createUserCashierToSurvey(
      UserCashierModel userModel) async {
    try {
      final docRef = firestore.collection(_userCashier).doc();
      final userData = UserCashierModel(
        uid: docRef.id,
        name: userModel.name,
        course: userModel.course,
        yearLevel: userModel.yearLevel,
        userType: userModel.userType,
        answered: userModel.answered,
        version: userModel.version,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
      );
      await docRef.set(userData.toMap());
      return userData;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserRegistrarModel> createUserRegistrarToSurvey(
      UserRegistrarModel userModel) async {
    try {
      final docRef = firestore.collection(_userRegistrar).doc();
      final userData = UserRegistrarModel(
        uid: docRef.id,
        name: userModel.name,
        course: userModel.course,
        yearLevel: userModel.yearLevel,
        userType: userModel.userType,
        answered: userModel.answered,
        version: userModel.version,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
      );
      await docRef.set(userData.toMap());
      return userData;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserSecurityOfficeModel> createUserSecurityOfficeToSurvey(
      UserSecurityOfficeModel userModel) async {
    try {
      final docRef = firestore.collection(_userSecurityOffice).doc();
      final userData = UserSecurityOfficeModel(
        uid: docRef.id,
        name: userModel.name,
        address: userModel.address,
        userType: userModel.userType,
        answered: userModel.answered,
        version: userModel.version,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
      );
      await docRef.set(userData.toMap());
      return userData;
    } catch (_) {
      rethrow;
    }
  }

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

  // static Future<UserModel> getUserData(String uid) async {
  //   final collectionRef = firestore.collection(_userData);
  //   final query = collectionRef
  //       .where('reference', isEqualTo: uid)
  //       .where('answered', isEqualTo: false);

  //   final result = await query.get();
  //   final user = result.docs.map((doc) {
  //     final map = doc.data();
  //     return UserModel.fromMap(map);
  //   }).toList();
  //   return user[0];
  // }

//**Update User if Already answer Each Office */

  static Future<UserLibraryModel?> updateUserLibraryAlreadyAnswer(
      UserLibraryModel user) async {
    try {
      final docRef = firestore.collection(_userLibrary).doc(user.uid);
      await docRef.update(user.toMap());
      return user;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserAdminOfficeModel?> updateUserAdminOfficeAlreadyAnswer(
      UserAdminOfficeModel user) async {
    try {
      final docRef = firestore.collection(_userAdminsOffice).doc(user.uid);
      await docRef.update(user.toMap());
      return user;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserCashierModel?> updateUserCashierAlreadyAnswer(
      UserCashierModel user) async {
    try {
      final docRef = firestore.collection(_userCashier).doc(user.uid);
      await docRef.set(user.toMap());
      return user;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserRegistrarModel?> updateUserRegistrarAlreadyAnswer(
      UserRegistrarModel user) async {
    try {
      final docRef = firestore.collection(_userRegistrar).doc(user.uid);
      await docRef.set(user.toMap());
      return user;
    } catch (_) {
      rethrow;
    }
  }

  static Future<UserSecurityOfficeModel?> updateUserSecurityOfficeAlreadyAnswer(
      UserSecurityOfficeModel user) async {
    try {
      final docRef = firestore.collection(_userSecurityOffice).doc(user.uid);
      await docRef.set(user.toMap());
      return user;
    } catch (_) {
      rethrow;
    }
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
