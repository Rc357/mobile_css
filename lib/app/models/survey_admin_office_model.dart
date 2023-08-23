import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyAdminOfficeModel {
  static const ID = 'id';
  static const USER_ID = 'user_id';
  static const QUESTION1 = 'question1';
  static const QUESTION2 = 'question2';
  static const REMARKS = 'remarks';
  static const CREATED_AT = 'created_at';
  static const UPDATED_AT = 'updated_at';

  final String id;
  final String userId;
  final String question1;
  final String question2;
  final String remarks;
  final DateTime createdAt;
  final DateTime updatedAt;

  SurveyAdminOfficeModel({
    required this.id,
    required this.userId,
    required this.question1,
    required this.question2,
    required this.remarks,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ID: id,
      USER_ID: userId,
      QUESTION1: question1,
      QUESTION2: question2,
      REMARKS: remarks,
      CREATED_AT: FieldValue.serverTimestamp(),
      UPDATED_AT: FieldValue.serverTimestamp(),
    };
  }

  factory SurveyAdminOfficeModel.fromMap(Map<String, dynamic> map) {
    return SurveyAdminOfficeModel(
      id: map[ID] as String,
      userId: map[USER_ID] as String,
      question1: map[QUESTION1] as String,
      question2: map[QUESTION2] as String,
      remarks: map[REMARKS] as String,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }
}
