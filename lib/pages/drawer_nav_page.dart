import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/drawer_nav_controller.dart';
import 'package:latihan111pplg2/controller/profile_controller.dart';


class DrawerNavPage extends StatelessWidget {
  DrawerNavPage({super.key});

  final DrawerNavController drawerNavController = Get.put(DrawerNavController());
  final profileController = Get.find<ProfileController>();
  
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text(
                  "HanSide",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("ihanaulia@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/seele.jpg"),
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
        body: drawerNavController.pages[drawerNavController.selectedIndex.value],
      ),
    );
  }
}