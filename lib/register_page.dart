import 'package:flutter/material.dart';
import 'package:latihan111pplg2/custom_button.dart';
import 'package:latihan111pplg2/custom_input.dart';
import 'package:latihan111pplg2/date_input.dart';
import 'package:latihan111pplg2/gender_radio.dart';
import 'package:latihan111pplg2/user_model.dart';
import 'package:latihan111pplg2/user_storage.dart';
import 'package:latihan111pplg2/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String selectedGender = "";
  DateTime? selectedBirthDate;
  String statusRegister = "";

  void handleRegister() {
    final username = usernameController.text;
    final password = passwordController.text;
    final nickname = nameController.text;

    if (username.isEmpty ||
        password.isEmpty ||
        nickname.isEmpty ||
        selectedGender.isEmpty ||
        selectedBirthDate == null) {
      setState(() {
        statusRegister = "All fields are required!";
      });
      return;
    }

    final isTaken = registeredUsers.any((user) => user.username == username);

    if (isTaken) {
      setState(() {
        statusRegister = "Username Is Already Taken!";
      });
      return;
    }

    final newUser = User(
      username: username,
      password: password,
      nickname: nickname,
      gender: selectedGender,
      birthDate: selectedBirthDate!,
    );

    registeredUsers.add(newUser);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    setState(() {
      statusRegister = "Registrasi Confirmed!";
    });

    print("Total User: ${registeredUsers.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome To The Register Page",
              style: TextStyle(
                fontSize: 20,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Please enter your credentials to register",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 20),
            CustomInputField(
              controller: usernameController,
              label: "Username",
            ),
            CustomInputField(
              controller: nameController,
              label: "Nickname",
            ),
            CustomInputField(
              controller: passwordController,
              label: "Password",
              isPassword: true,
            ),
            GenderSelector(
              onChanged: (gender) {
                setState(() {
                  selectedGender = gender;
                });
              },
            ),
            ReadOnlyDatePicker(
              onDateSelected: (date) {
                setState(() {
                  selectedBirthDate = date;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Login",
              onPressed: handleRegister,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Already have an account? Login"),
            ),
            Text(statusRegister),
          ],
        ),
      ),
    );
  }
}
