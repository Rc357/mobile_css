import 'package:css/app/enum/gender_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(GenderEnum?) onChanged;

  static const _genders = [
    GenderEnum.male,
    GenderEnum.female,
    GenderEnum.other,
  ];

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: FormBuilderDropdown(
        name: 'gender',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: (value) => null,
        items: _genders.map((gender) {
          return DropdownMenuItem<GenderEnum>(
            value: gender,
            child: Text(gender.description),
          );
        }).toList(),
        decoration: InputDecoration(
          label: const Text('Gender'),
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
