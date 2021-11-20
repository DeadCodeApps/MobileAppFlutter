import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/text_field_container.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: primaryColor,
            ),
            hintText: "Contraseña",
            suffixIcon: Icon(
              Icons.visibility,
              color: primaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
