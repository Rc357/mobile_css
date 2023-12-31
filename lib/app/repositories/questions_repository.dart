import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:css/app/models/notification_model.dart';
import 'package:css/app/models/question_model.dart';
import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/thank_you_message_model.dart';

class QuestionsRepository {
  static const String _version = 'version';
  static const String _notifications = 'notifications';

  static Future<QuestionModel?> findLatestVersion(String office) async {
    final collectionRef = firestore.collection(office);
    QuerySnapshot snapshot =
        await collectionRef.orderBy('version', descending: true).limit(1).get();

    if (snapshot.docs.isNotEmpty) {
      return QuestionModel.fromDocument(snapshot.docs[0]);
    } else {
      return null;
    }
  }

  static Future<List<QuestionModel>> getQuestions(
      String office, int version) async {
    final collectionRef = firestore.collection(office);
    final query = collectionRef
        .orderBy(QuestionModel.QUESTION_NUMBER)
        .where(_version, isEqualTo: version);
    final result = await query.get();
    final admins = result.docs.map((doc) {
      final map = doc.data();
      return QuestionModel.fromMap(map);
    }).toList();
    return admins;
  }

  static Future<void> updateQuestionViaId(
      QuestionModel questionWithAnswer, String office) async {
    try {
      final docRef = firestore.collection(office).doc(questionWithAnswer.id);
      await docRef.update(questionWithAnswer.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<ThankYouMessageModel>> getMessages(
      String office, int version) async {
    final collectionRef = firestore.collection(office);
    final query = collectionRef
        .orderBy(ThankYouMessageModel.CREATED_AT)
        .where('version', isEqualTo: version);
    final result = await query.get();
    final admins = result.docs.map((doc) {
      final map = doc.data();
      return ThankYouMessageModel.fromMap(map);
    }).toList();
    return admins;
  }

  static Future<bool> createNotificationData(
      {required String questionnaireVersion,
      required int version,
      required String userId,
      required String officeName}) async {
    try {
      final docRef = firestore.collection(_notifications).doc();
      final userData = NotificationModel(
        id: docRef.id,
        questionnaireVersion: questionnaireVersion,
        version: version,
        userId: userId,
        officeName: officeName,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await docRef.set(userData.toMap());
      return true;
    } catch (_) {
      rethrow;
    }
  }
}
