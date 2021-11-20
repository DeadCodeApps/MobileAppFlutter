import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/text_field_container.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color inputColor;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.inputColor = primaryLightColor,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: primaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
      inputColor: inputColor,
    );
  }
}
