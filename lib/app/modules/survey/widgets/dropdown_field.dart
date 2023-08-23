import 'package:css/app/enum/survey_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:line_icons/line_icons.dart';

class SurveySizeDropdown extends StatelessWidget {
  SurveySizeDropdown({
    Key? key,
    required this.onChanged,
    required this.name,
    required this.number,
  }) : super(key: key);

  final void Function(SurveyEnum?) onChanged;
  final String name;
  final int number;

  final surveyAnswer = [
    SurveyEnum.excellent,
    SurveyEnum.verySatisfactory,
    SurveyEnum.satisfactory,
    SurveyEnum.fair,
    SurveyEnum.poor,
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
          return DropdownMenuItem<SurveyEnum>(
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
