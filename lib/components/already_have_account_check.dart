import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "No tienes una cuenta todavía? " : "Ya tiene una cuenta? ",
          style: const TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: () => press(),
          child: Text(
            login ? "Registrarse" : "Ingresar",
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
