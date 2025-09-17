import 'package:csi_attendance/utils/styles.dart';
import 'package:flutter/material.dart';

class FormFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const FormFieldInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Styles.textStyle,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hint: Text(hintText, style: Styles.hintTextStyle),
      ),
    );
  }
}
