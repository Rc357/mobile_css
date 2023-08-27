import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/utils.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.label,
    this.showPrefixIcon = true,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final void Function(String?)? onChanged;
  final String hintText;
  final String label;
  final bool showPrefixIcon;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: label,
      onChanged: onChanged,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required'.tr;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: showPrefixIcon ? const Icon(Icons.text_fields) : null,
        filled: true,
        fillColor: Colors.white,
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
        labelText: label,
        // ignore: prefer_const_constructors
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class NumberTextFieldInput extends StatelessWidget {
  const NumberTextFieldInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.label,
    this.showPrefixIcon = true,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final void Function(String?)? onChanged;
  final String hintText;
  final String label;
  final bool showPrefixIcon;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: label,
      maxLength: 11,
      onChanged: onChanged,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required'.tr;
        } else if (value.length < 10) {
          return 'Invalid phone number length.'.tr;
        } else if (value[0] != '0' || value[1] != '9') {
          return 'Invalid phone number.'.tr;
        }
        return null;
      },
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: showPrefixIcon ? const Icon(Icons.text_fields) : null,
        filled: true,
        fillColor: Colors.white,
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
        labelText: label,
        // ignore: prefer_const_constructors
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
