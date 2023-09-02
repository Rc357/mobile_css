import 'package:css/app/enum/survey_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:line_icons/line_icons.dart';

class FivePointsSurveyDropdown extends StatelessWidget {
  FivePointsSurveyDropdown({
    Key? key,
    required this.onChanged,
    required this.name,
    required this.number,
  }) : super(key: key);

  final void Function(FivePointsCaseEnum?) onChanged;
  final String name;
  final int number;

  final surveyAnswer = [
    FivePointsCaseEnum.excellent,
    FivePointsCaseEnum.verySatisfactory,
    FivePointsCaseEnum.satisfactory,
    FivePointsCaseEnum.fair,
    FivePointsCaseEnum.poor,
  ];

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: FormBuilderDropdown(
        name: name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return 'Choose an answer';
          }
          return null;
        },
        items: surveyAnswer.map((businessSize) {
          return DropdownMenuItem<FivePointsCaseEnum>(
            value: businessSize,
            child: Text(
              businessSize.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          label: Text('Choose an answer for question #$number'),
          border: const OutlineInputBorder(borderSide: BorderSide()),
        ),
        icon: const Icon(LineIcons.angleDown),
        dropdownColor: Colors.white,
      ),
    );
  }
}

class TwoPointsSurveyDropdown extends StatelessWidget {
  TwoPointsSurveyDropdown({
    Key? key,
    required this.onChanged,
    required this.name,
    required this.number,
  }) : super(key: key);

  final void Function(TwoPointsCaseEnum?) onChanged;
  final String name;
  final int number;

  final surveyAnswer = [
    TwoPointsCaseEnum.yes,
    TwoPointsCaseEnum.no,
  ];

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: FormBuilderDropdown(
        name: name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return 'Choose an answer';
          }
          return null;
        },
        items: surveyAnswer.map((businessSize) {
          return DropdownMenuItem<TwoPointsCaseEnum>(
            value: businessSize,
            child: Text(
              businessSize.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          label: Text('Choose an answer for question #$number'),
          border: const OutlineInputBorder(borderSide: BorderSide()),
        ),
        icon: const Icon(LineIcons.angleDown),
        dropdownColor: Colors.white,
      ),
    );
  }
}
