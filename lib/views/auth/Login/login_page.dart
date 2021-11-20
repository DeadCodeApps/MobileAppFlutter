import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/already_have_account_check.dart';
import 'package:freelance_world_flutter/components/rounded_button.dart';
import 'package:freelance_world_flutter/components/rounded_input_field.dart';
import 'package:freelance_world_flutter/components/rounded_password_field.dart';
import 'package:freelance_world_flutter/models/employer.dart';
import 'package:freelance_world_flutter/models/user.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
import 'package:freelance_world_flutter/services/freelancer_service.dart';
import 'package:freelance_world_flutter/services/user_service.dart';
import 'package:freelance_world_flutter/views/auth/register/register_page.dart';
import 'package:freelance_world_flutter/views/employer/employer_home/employer_home_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_home/freelancer_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Image.asset(
                "assets/logo.png",
                width: size.width * 0.5,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                controller: emailInputController,
                hintText: "Correo",
                onChanged: (value) {},
                icon: Icons.person,
              ),
              RoundedPasswordField(
                controller: passwordInputController,
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedButton(
                  text: "INGRESAR",
                  press: () {
                    print(emailInputController.text);
                    print(passwordInputController.text);
                    login(emailInputController.text,
                        passwordInputController.text, context);
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> login(String email, String password, BuildContext context) async {
  final response = await http.patch(
    Uri.parse("https://freelance-world.herokuapp.com/api/login/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    Map<String, dynamic> token = Jwt.parseJwt(map["token"]);
    String userId = token["sub"];

    saveToken(map["token"]);
    saveUserId(userId);

    String accountType = await getUsertype(userId);
    saveUserData(userId, accountType);

    if (accountType == "FREELANCER") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FreelancerHomePage();
      }));
    } else if (accountType == "EMPLOYER") {
      print("employer");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EmployerHomePage();
      }));
    }
  } else {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Datos Incorrectos'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Los datos ingresados son inválidos'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Entiendo'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<void> saveUserId(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('id', id);
}

Future<void> saveUserData(String id, String accountType) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (accountType == "FREELANCER") {
    final freelancer = await getFreelancerById(id);
    User user = User(
        firstname: freelancer.firstname,
        lastname: freelancer.lastname,
        email: freelancer.email);
    await prefs.setString('fullname', user.getFullName());
    await prefs.setString('email', user.email!);
  } else if (accountType == "EMPLOYER") {
    final employer = await getEmployerById(id);
    User user = User(
        firstname: employer.firstname,
        lastname: employer.lastname,
        email: employer.email);
    await prefs.setString('fullname', user.getFullName());
    await prefs.setString('email', user.email!);
  }
}
