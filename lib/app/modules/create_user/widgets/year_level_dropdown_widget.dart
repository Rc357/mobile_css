import 'package:css/app/enum/year_level_enum.dart';
import 'package:css/app/modules/create_user/controller/course_and_year_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class YearLevelDropdown extends StatelessWidget {
  YearLevelDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(YearLevelEnum?) onChanged;
  final courseAndYearLevelController = CourseAndYearLevelController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ButtonTheme(
        alignedDropdown: true,
        child: FormBuilderDropdown(
          name: 'yearLevel',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          validator: (value) => null,
          items: courseAndYearLevelController.yearLevel.map((year) {
            return DropdownMenuItem<YearLevelEnum>(
              value: year,
              child: Text(year.description),
            );
          }).toList(),
          decoration: InputDecoration(
            label: const Text('Year Level'),
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
      ),
    );
  }
}
