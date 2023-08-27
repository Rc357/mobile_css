import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/survey_admin_office_model.dart';
import 'package:css/app/models/survey_library_model.dart';

class SurveyRepository {
  static const String _surveyLibrary = 'remarksLibrary';
  static const String _surveyAdminOffice = 'remarksAdminOffice';
  static const String _surveySecurityOffice = 'remarksSecurityOffice';
  static const String _surveyRegistrarOffice = 'remarksRegistrarOffice';
  static const String _surveyCashierOffice = 'remarksCashierOffice';

  static Future<void> createSurveyLibrary(RemarksModel surveyLib) async {
    try {
      final docRef = firestore.collection(_surveyLibrary).doc(surveyLib.id);
      await docRef.set(surveyLib.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> createSurveyAdminOffice(
      SurveyAdminOfficeModel survey) async {
    try {
      final docRef = firestore.collection(_surveyAdminOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> createSurveySecurityOffice(RemarksModel survey) async {
    try {
      final docRef = firestore.collection(_surveySecurityOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> createSurveyRegistrarOffice(RemarksModel survey) async {
    try {
      final docRef =
          firestore.collection(_surveyRegistrarOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> createSurveyCashierOffice(RemarksModel survey) async {
    try {
      final docRef = firestore.collection(_surveyCashierOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }
}
