import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 1,
          offset: const Offset(0, 3),
        )
      ], borderRadius: BorderRadius.circular(29)),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: textColor,
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 30),
          ),
          onPressed: () => press(),
          child: Text(text),
        ),
      ),
    );
  }
}
