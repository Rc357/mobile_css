enum TwoPointsCaseEnum {
  yes('Yes'),
  no('No'),
  unknown('Unknown');

  const TwoPointsCaseEnum(this.description);
  final String description;
}

enum FivePointsCaseEnum {
  excellent('Excellent'),
  verySatisfactory('Very Satisfactory'),
  satisfactory('Satisfactory'),
  fair('Fair'),
  poor('Poor'),
  unknown('Unknown');

  const FivePointsCaseEnum(this.description);
  final String description;
}
