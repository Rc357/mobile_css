import 'package:css/app/models/question_model.dart';
import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/thank_you_message_model.dart';

class QuestionsRepository {
  static Future<List<QuestionModel>> getQuestions(String office) async {
    final collectionRef = firestore.collection(office);
    final query = collectionRef.orderBy(QuestionModel.QUESTION_NUMBER);
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

  static Future<List<ThankYouMessageModel>> getMessages(String office) async {
    final collectionRef = firestore.collection(office);
    final query = collectionRef.orderBy(ThankYouMessageModel.CREATED_AT);
    final result = await query.get();
    final admins = result.docs.map((doc) {
      final map = doc.data();
      return ThankYouMessageModel.fromMap(map);
    }).toList();
    return admins;
  }
}
