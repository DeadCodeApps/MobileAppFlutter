import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/freelancer.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:freelance_world_flutter/views/auth/Login/login_page.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterFreelancerPage extends StatefulWidget {
  const RegisterFreelancerPage({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterFreelancerPage> {
  late DateTime? selectedDate;
  bool _isObscure = true;
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  final professionController = TextEditingController();

  Future<Freelancer> postFreelancer(Freelancer auxFreelancer) async {
    final response = await http.post(
      Uri.parse('https://freelance-world.herokuapp.com/api/freelancers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': auxFreelancer.username,
        'email': auxFreelancer.email,
        'password': auxFreelancer.password,
        'firstname': auxFreelancer.firstname,
        'lastname': auxFreelancer.lastname,
        'birthDate': auxFreelancer.birthDate,
        'phone': auxFreelancer.phone,
        'description': auxFreelancer.description,
        'profession': auxFreelancer.profession
      }),
    );

    if (response.statusCode == 200) {
      return Freelancer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create freelancer.');
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
                "Registrarse como freelancer",
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
                decoration: const InputDecoration(labelText: "Usuario"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                obscureText: _isObscure,
                enableSuggestions: false,
                autocorrect: false,
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
                  controller: dateController,
                  decoration:
                      const InputDecoration(labelText: "Fecha de cumpleaños"),
                  onTap: () async {
                    selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025));
                    if (selectedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(selectedDate!);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  }),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Número"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Descripción"),
              ),
              TextFormField(
                controller: professionController,
                decoration: const InputDecoration(labelText: "Profesión"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Registrar"),
                onPressed: () {
                  Freelancer freelancer = Freelancer(
                      email: emailController.text,
                      username: usernameController.text,
                      password: passwordController.text,
                      firstname: firstnameController.text,
                      lastname: lastnameController.text,
                      birthDate: selectedDate!.toIso8601String(),
                      profession: professionController.text,
                      description: descriptionController.text,
                      phone: phoneController.text);
                  postFreelancer(freelancer);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
