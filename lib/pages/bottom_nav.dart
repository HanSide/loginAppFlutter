import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/bottom_navcontroller.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BottomNavController bottomNavController = Get.put(
    BottomNavController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: bottomNavController.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
