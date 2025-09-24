import 'package:flutter/material.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_button.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_input.dart';
import 'package:latihan111pplg2/date_input.dart';
import 'package:latihan111pplg2/gender_radio.dart';
import 'package:latihan111pplg2/user_model.dart';
import 'package:latihan111pplg2/user_storage.dart';
import 'package:latihan111pplg2/login_page.dart';
import 'package:latihan111pplg2/custom_text.dart';



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
      MaterialPageRoute(builder: (context) => const LoginPages(),
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
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              myText: "Welcome To The Register Page",
              myTextColor: Colors.cyanAccent,
              size: 20,
              type: FontWeight.bold,
            ),
    
            CustomText(
              myText: "Please enter your credentials to register",
              myTextColor: Colors.black,
              size: 8,
              type: FontWeight.normal,
            ),
            
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
           
            CustomButton(
              text: "Login",
              onPressed: handleRegister,
              myTextColor: (Colors.blue),
            ),
            
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPages()),
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
