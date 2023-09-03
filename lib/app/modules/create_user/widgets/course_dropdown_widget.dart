import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CourseDropdown extends StatelessWidget {
  CourseDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(CourseEnum?) onChanged;
  final courseAndYearLevelController = CourseAndYearLevelController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => courseAndYearLevelController.courses.isEmpty
          ? ButtonTheme(
              alignedDropdown: true,
              child: FormBuilderDropdown(
                name: 'course',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: null,
                validator: (value) => null,
                items: courseAndYearLevelController.courses.map((course) {
                  return DropdownMenuItem<String>(
                    value: '',
                    child: Text(course.description),
                  );
                }).toList(),
                decoration: InputDecoration(
                  label: const Text('Course'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
                dropdownColor: Colors.white,
              ),
            )
          : ButtonTheme(
              alignedDropdown: true,
              child: FormBuilderDropdown(
                name: 'course',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: onChanged,
                validator: (value) => null,
                items: courseAndYearLevelController.courses.map((course) {
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
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
                dropdownColor: Colors.white,
              ),
            ),
    );
  }
}
