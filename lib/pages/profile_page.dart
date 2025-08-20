import 'package:flutter/material.dart';
import 'package:latihan111pplg2/custom_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/seele.jpg"),
                  ),
                ),
                SizedBox(height: 20),

                CustomText(myText: "Nama : Muhammad Rayhan Aulia", size: 16, type: FontWeight.bold),
                SizedBox(height: 8),

                CustomText(myText: "Absen : 24", size: 16, type: FontWeight.bold),
                SizedBox(height: 8),

                CustomText(myText: "Kelas : XI PPLG 2", size: 16, type: FontWeight.bold),
                SizedBox(height: 8),

                CustomText(
                  myText: "Asal : Bae Kudus Jawa Tengah",
                  size: 16,
                  type: FontWeight.bold,
                ),
                SizedBox(height: 8),

                CustomText(myText: "Hobi : Membaca", size: 16, type: FontWeight.bold),
              ],
            ),
          ),
        ),
      ),
    );
  }
}