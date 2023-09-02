import 'package:css/app/enum/type_user_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserTypeDropdown extends StatelessWidget {
  const UserTypeDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(UserTypeEnum?) onChanged;

  static const _userTypes = [
    UserTypeEnum.student,
    UserTypeEnum.alumni,
    UserTypeEnum.parents,
    UserTypeEnum.guest,
  ];

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: FormBuilderDropdown(
        name: 'userType',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: (value) => null,
        items: _userTypes.map((userType) {
          return DropdownMenuItem<UserTypeEnum>(
            value: userType,
            child: Text(userType.description),
          );
        }).toList(),
        decoration: InputDecoration(
          label: const Text('User Type'),
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
