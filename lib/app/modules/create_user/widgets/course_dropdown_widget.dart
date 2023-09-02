import 'package:css/app/enum/course_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CourseDropdown extends StatelessWidget {
  const CourseDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(CourseEnum?) onChanged;

  static const _courses = [
    CourseEnum.bsElementaryEducation,
    CourseEnum.bsEducationEnglishMath,
    CourseEnum.bsAutomotiveTechnology,
    CourseEnum.bsComputerEngineering,
    CourseEnum.bsElectricalTechnology,
    CourseEnum.bsElectronicsEngineering,
    CourseEnum.bsElectronicsTechnology,
    CourseEnum.bsEntrepreneurship,
    CourseEnum.bsFoodTechnology,
    CourseEnum.bsInformationSystem,
    CourseEnum.bsInformationTechnology,
    CourseEnum.bsInformationTechnologyAnimation,
    CourseEnum.bsMechanicalTechnology,
    CourseEnum.bsNursing,
    CourseEnum.bTechnologyLivelihoodEducation,
  ];

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: FormBuilderDropdown(
        name: 'course',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: (value) => null,
        items: _courses.map((course) {
          return DropdownMenuItem<CourseEnum>(
            value: course,
            child: Text(course.description),
          );
        }).toList(),
        decoration: InputDecoration(
          label: const Text('Course'),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 30,
        ),
        dropdownColor: Colors.white,
      ),
    );
  }
}
