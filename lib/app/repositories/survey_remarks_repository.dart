import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/survey_remarks.dart';

class SurveyRemarksRepository {
  static const String _surveyRemarks = 'surveyRemarks';

  static Future<void> createSurveyRemarks(SurveyRemarksModel remarks) async {
    try {
      final docRef = firestore.collection(_surveyRemarks).doc(remarks.id);
      await docRef.set(remarks.toMap());
    } catch (_) {
      rethrow;
    }
  }
}
