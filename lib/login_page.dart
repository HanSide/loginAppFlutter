import 'package:flutter/material.dart';
import 'package:latihan111pplg2/register_page.dart';
import 'custom_input.dart';
import 'custom_button.dart';
import 'package:latihan111pplg2/user_storage.dart';
import 'package:latihan111pplg2/user_page.dart';
import 'package:collection/collection.dart';
import 'package:latihan111pplg2/user_model.dart'; // Make sure this file contains the User class
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String statusLogin = "";

  void handleLogin() {
    final user = usernameController.text;
    final pass = passwordController.text;

    User? matchedUser = registeredUsers.firstWhereOrNull(
  (u) => u.username == user && u.password == pass,
);


    final isValid = matchedUser != null;

    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDataPage(user: matchedUser),
        ),
      );
    }

    setState(() {
      statusLogin = isValid ? "Login Success" : "Login Failed";
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome To The Login Page",
              style: TextStyle(
                fontSize: 20,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Please enter your credentials to login",
              style: TextStyle(fontSize: 8),
            ),
            const SizedBox(height: 20),
            CustomInputField(
              controller: usernameController,
              label: "Username",
            ),
            CustomInputField(
              controller: passwordController,
              label: "Password",
              isPassword: true,
            ),
            CustomButton(
              text: "Login",
              onPressed: handleLogin,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const RegisterPage()),
               );
              },
              child: const Text("Register"),
            ),
            Text(statusLogin),
          ],
        ),
      ),
    );
  }
}
