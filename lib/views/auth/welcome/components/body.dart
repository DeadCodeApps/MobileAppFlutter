import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_world_flutter/components/rounded_button.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:freelance_world_flutter/views/auth/Login/login_page.dart';
import 'package:freelance_world_flutter/views/auth/register/register_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "WELCOME TO FREELANCEWORLD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SvgPicture.asset(
                "assets/welcome.svg",
                height: size.height * 0.30,
              ),
            ),
            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: RoundedButton(
                text: "REGISTRARSE",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }),
                  );
                },
                color: secondaryColor,
                textColor: secondaryTextColor,
              ),
            )
          ],
        ));
  }
}
