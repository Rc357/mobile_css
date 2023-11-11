import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  static const ID = 'id';
  static const QUESTIONNAIRE_VERSION = 'questionnaireVersion';
  static const VERSION = 'version';
  static const USER_ID = 'userId';
  static const OFFICE_NAME = 'officeName';
  static const CREATED_AT = 'created_at';
  static const UPDATED_AT = 'updated_at';

  final String id;
  final String questionnaireVersion;
  final int version;
  final String userId;
  final String officeName;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.questionnaireVersion,
    required this.version,
    required this.userId,
    required this.officeName,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ID: id,
      QUESTIONNAIRE_VERSION: questionnaireVersion,
      VERSION: version,
      USER_ID: userId,
      OFFICE_NAME: officeName,
      CREATED_AT: FieldValue.serverTimestamp(),
      UPDATED_AT: FieldValue.serverTimestamp(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map[ID] as String,
      questionnaireVersion: map[QUESTIONNAIRE_VERSION] as String,
      version: map[VERSION] as int,
      userId: map[USER_ID] as String,
      officeName: map[OFFICE_NAME] as String,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }
}
