import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/employer.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterEmployerPage extends StatefulWidget {
  const RegisterEmployerPage({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterEmployerPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  final companyPhoneController = TextEditingController();
  final companyNameController = TextEditingController();
  final companyWebController = TextEditingController();
  final contactCompanyEmailController = TextEditingController();

  Future<Employer> postEmployer(Employer auxEmployer) async {
    final response = await http.post(
      Uri.parse('https://freelance-world.herokuapp.com/api/employers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': auxEmployer.username,
        'email': auxEmployer.email,
        'password': auxEmployer.password,
        'firstname': auxEmployer.firstname,
        'lastname': auxEmployer.lastname,
        'personalPhone': auxEmployer.personalPhone,
        'description': auxEmployer.description,
        'companyPhone': auxEmployer.companyPhone,
        'companyName': auxEmployer.companyName,
        'companyWeb': auxEmployer.companyWeb,
        'contactCompanyEmail': auxEmployer.contactCompanyEmail
      }),
    );

    if (response.statusCode == 200) {
      print(Employer.fromJson(jsonDecode(response.body)));
      return Employer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create employer.');
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FreelanceWorld"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(children: [
              Text(
                "Registrarse como empleador",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                    fontSize: 20),
              ),
              Divider(
                color: Colors.blue[800],
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Correo"),
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Contraseña"),
              ),
              TextFormField(
                controller: firstnameController,
                decoration: const InputDecoration(labelText: "Nombres"),
              ),
              TextFormField(
                controller: lastnameController,
                decoration: const InputDecoration(labelText: "Apellidos"),
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Número personal"),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Descripción"),
              ),
              TextFormField(
                controller: companyPhoneController,
                decoration:
                    const InputDecoration(labelText: "Número de la empresa"),
              ),
              TextFormField(
                controller: companyNameController,
                decoration:
                    const InputDecoration(labelText: "Nombre de la empresa"),
              ),
              TextFormField(
                controller: companyWebController,
                decoration:
                    const InputDecoration(labelText: "Web de la empresa"),
              ),
              TextFormField(
                controller: contactCompanyEmailController,
                decoration: const InputDecoration(
                    labelText: "Correo de contacto de la empresa"),
              ),
              ElevatedButton(
                child: const Text("Registrar"),
                onPressed: () {
                  Employer employer = Employer(
                      email: emailController.text,
                      username: usernameController.text,
                      password: passwordController.text,
                      firstname: firstnameController.text,
                      lastname: lastnameController.text,
                      personalPhone: phoneController.text,
                      description: descriptionController.text,
                      companyPhone: companyPhoneController.text,
                      companyName: companyNameController.text,
                      companyWeb: companyWebController.text,
                      contactCompanyEmail: contactCompanyEmailController.text);
                  postEmployer(employer);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
