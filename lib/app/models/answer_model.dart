class AnswerModel {
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
  static const UPDATED_AT = 'updated_at';
  static const CREATED_AT = 'created_at';

  final String id;
  final String question;
  final int questionNumber;
  final String type;
  final int agree;
  final int disagree;
  final int excellent;
  final int verySatisfactory;
  final int satisfactory;
  final int fair;
  final int poor;
  final DateTime updatedAt;
  final DateTime createdAt;

  AnswerModel({
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
    required this.updatedAt,
    required this.createdAt,
  });
}
