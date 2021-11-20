import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:freelance_world_flutter/views/auth/register/employer_register/register_employer_page.dart';
import 'package:freelance_world_flutter/views/auth/register/freelancer_register/register_freelancer_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const RegisterFreelancerPage();
                }),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/freelancer.png",
                    width: size.width * 0.3,
                  ),
                  Text("FREELANCER")
                ],
              ),
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
            color: primaryColor,
            indent: 60,
            endIndent: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const RegisterEmployerPage();
                }),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/employer.png",
                    width: size.width * 0.3,
                  ),
                  Text("EMPLOYER")
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
