import 'package:cloud_firestore/cloud_firestore.dart';

class RemarksModel {
  static const ID = 'id';
  static const USER_ID = 'userId';
  static const QUESTION_ID = 'questionId';
  static const REMARKS = 'remarks';
  static const CREATED_AT = 'created_at';
  static const UPDATED_AT = 'updated_at';

  final String id;
  final String userId;
  final String questionId;
  final String remarks;
  final DateTime createdAt;
  final DateTime updatedAt;

  RemarksModel({
    required this.id,
    required this.userId,
    required this.questionId,
    required this.remarks,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ID: id,
      USER_ID: userId,
      QUESTION_ID: questionId,
      REMARKS: remarks,
      CREATED_AT: FieldValue.serverTimestamp(),
      UPDATED_AT: FieldValue.serverTimestamp(),
    };
  }

  factory RemarksModel.fromMap(Map<String, dynamic> map) {
    return RemarksModel(
      id: map[ID] as String,
      userId: map[USER_ID] as String,
      questionId: map[QUESTION_ID] as String,
      remarks: map[REMARKS] as String,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }
}
