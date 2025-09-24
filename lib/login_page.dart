import 'package:flutter/material.dart';
import 'package:latihan111pplg2/custom_text.dart';
import 'package:latihan111pplg2/register_page.dart';
import 'widgetdesigned/custom_input.dart';
import 'widgetdesigned/custom_button.dart';
import 'package:latihan111pplg2/user_storage.dart';
import 'package:latihan111pplg2/user_page.dart';
import 'package:collection/collection.dart';
import 'package:latihan111pplg2/user_model.dart'; 
class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPages> {
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
            CustomText(myText: "Welcome to the login page", size: 20, type: FontWeight.bold),
            const SizedBox(height: 20),
            CustomText(myText: "Please enter your login data", size: 8, type: FontWeight.normal),
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
              myTextColor: (Colors.blue),
              
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
