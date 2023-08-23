import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyRemarksModel {
  static const ID = 'id';
  static const REMARKS = 'remarks';
  static const REFERENCE = 'reference';
  static const CREATED_AT = 'created_at';
  static const UPDATED_AT = 'updated_at';

  final String id;
  final String remarks;
  final String reference;
  final DateTime createdAt;
  final DateTime updatedAt;

  SurveyRemarksModel({
    required this.id,
    required this.remarks,
    required this.reference,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ID: id,
      REMARKS: remarks,
      REFERENCE: reference,
      CREATED_AT: FieldValue.serverTimestamp(),
      UPDATED_AT: FieldValue.serverTimestamp(),
    };
  }

  factory SurveyRemarksModel.fromMap(Map<String, dynamic> map) {
    return SurveyRemarksModel(
      id: map[ID] as String,
      remarks: map[REMARKS] as String,
      reference: map[REFERENCE] as String,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }
}
