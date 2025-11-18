import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/drawer_nav_controller.dart';
import 'package:latihan111pplg2/controller/login_api_controller.dart';

class DrawerNavPage extends StatelessWidget {
  DrawerNavPage({super.key});

  final DrawerNavController drawerNavController = Get.put(
    DrawerNavController(),
  );
  final loginController = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = loginController.firebaseUser.value;
      final userName = user?.displayName ?? "Guest User";
      final userEmail = user?.email ?? "No email";
      final userPhotoUrl = user?.photoURL;

      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text(
                  userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(userEmail),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: userPhotoUrl != null
                      ? NetworkImage(userPhotoUrl)
                      : AssetImage("assets/images/seele.jpg") as ImageProvider,
                  child: userPhotoUrl == null
                      ? Icon(Icons.person, size: 40)
                      : null,
                ),
              ),
              ...drawerNavController.menuItems.asMap().entries.map((idx) {
                return ListTile(
                  leading: Icon(idx.value["icon"]),
                  title: Text(idx.value["title"]),
                  onTap: () {
                    drawerNavController.changeIndex(idx.key);
                    Get.back();
                  },
                );
              }),
            ],
          ),
        ),
        body:
            drawerNavController.pages[drawerNavController.selectedIndex.value],
      );
    });
  }
}
