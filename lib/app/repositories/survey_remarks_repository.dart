import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/survey_remarks.dart';

class SurveyRemarksRepository {
  static const String _surveyRemarks = 'surveyRemarks';

  static Future<void> createSurveyRemarks(SurveyRemarksModel remarks) async {
    try {
      final docRef = firestore.collection(_surveyRemarks).doc();
      final remarksFinal = SurveyRemarksModel(
        id: docRef.id,
        remarks: remarks.remarks,
        referenceUser: remarks.referenceUser,
        officeName: remarks.officeName,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await docRef.set(remarksFinal.toMap());
    } catch (_) {
      rethrow;
    }
  }
}
