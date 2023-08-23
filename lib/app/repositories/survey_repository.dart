import 'package:css/app/instances/firebase_instances.dart';
import 'package:css/app/models/survey_admin_office_model.dart';
import 'package:css/app/models/survey_library_model.dart';

class SurveyRepository {
  static const String _surveyLibrary = 'surveyLibrary';
  static const String _surveyAdminOffice = 'surveyAdminOffice';
  static const String _surveySecurityOffice = 'surveySecurityOffice';
  static const String _surveyRegistrarOffice = 'surveyRegistrarOffice';
  static const String _surveyCashierOffice = 'surveyCashierOffice';

  static Future<void> createSurveyLibrary(SurveyLibraryModel surveyLib) async {
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

  static Future<void> createSurveySecurityOffice(
      SurveyLibraryModel survey) async {
    try {
      final docRef = firestore.collection(_surveySecurityOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> createSurveyRegistrarOffice(
      SurveyLibraryModel survey) async {
    try {
      final docRef =
          firestore.collection(_surveyRegistrarOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> createSurveyCashierOffice(
      SurveyLibraryModel survey) async {
    try {
      final docRef = firestore.collection(_surveyCashierOffice).doc(survey.id);
      await docRef.set(survey.toMap());
    } catch (_) {
      rethrow;
    }
  }
}
