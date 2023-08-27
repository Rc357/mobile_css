import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:css/app/enum/question_type_enum.dart';

class QuestionModel {
  static const ID = 'questionId';
  static const QUESTION_NUMBER = 'questionNumber';
  static const QUESTION = 'question';
  static const AGREE = 'agree';
  static const DISAGREE = 'disagree';
  static const EXCELlENT = 'excellent';
  static const VERY_SATISFACTORY = 'verySatisfactory';
  static const SATISFACTORY = 'satisfactory';
  static const FAIR = 'fair';
  static const POOR = 'poor';
  static const TYPE = 'type';
  static const CREATED_AT = 'created_at';
  static const UPDATED_AT = 'updated_at';

  final String id;
  final String question;
  final int questionNumber;
  final QuestionTypeEnum type;
  final int agree;
  final int disagree;
  final int excellent;
  final int verySatisfactory;
  final int satisfactory;
  final int fair;
  final int poor;
  final DateTime createdAt;
  final DateTime updatedAt;

  QuestionModel({
    required this.id,
    required this.question,
    required this.questionNumber,
    required this.type,
    required this.agree,
    required this.disagree,
    required this.excellent,
    required this.verySatisfactory,
    required this.satisfactory,
    required this.fair,
    required this.poor,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ID: id,
      QUESTION: question,
      QUESTION_NUMBER: questionNumber,
      TYPE: type.name,
      AGREE: agree,
      DISAGREE: disagree,
      EXCELlENT: excellent,
      VERY_SATISFACTORY: verySatisfactory,
      SATISFACTORY: satisfactory,
      FAIR: fair,
      POOR: poor,
      CREATED_AT: FieldValue.serverTimestamp(),
      UPDATED_AT: FieldValue.serverTimestamp(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map[ID] as String,
      question: map[QUESTION] as String,
      questionNumber: map[QUESTION_NUMBER] as int,
      type: QuestionTypeEnum.values.byName(map[TYPE] as String),
      agree: map[AGREE] as int,
      disagree: map[DISAGREE] as int,
      excellent: map[EXCELlENT] as int,
      verySatisfactory: map[VERY_SATISFACTORY] as int,
      satisfactory: map[SATISFACTORY] as int,
      fair: map[FAIR] as int,
      poor: map[POOR] as int,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }
}