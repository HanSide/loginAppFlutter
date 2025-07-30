import 'package:flutter/material.dart';
import 'user_model.dart';

class UserDataPage extends StatelessWidget {
  final User user;

  const UserDataPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Data")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/seele.jpg",
                width: 200,
                height: 100,
              ),
            ),
            Text("Data Information"),
            SizedBox(height: 20),
            Text("Username: ${user.username}"),
            Text("Nickname: ${user.nickname}"),
            Text("Gender: ${user.gender}"),
            Text("Tanggal Lahir: ${user.birthDate.toLocal()}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
