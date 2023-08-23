enum SurveyEnum {
  excellent('Excellent'),
  verySatisfactory('Very Satisfactory'),
  satisfactory('Satisfactory'),
  fair('Fair'),
  poor('Poor'),
  unknown('Unknown');

  const SurveyEnum(this.description);
  final String description;
}
