import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.name,
    required this.onChanged,
    required this.label,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
  }) : super(key: key);

  final String name;
  final void Function(String?) onChanged;
  final String label;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      style: TextStyle(color: Colors.black),
      name: name,
      onChanged: onChanged,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
    );
  }
}
