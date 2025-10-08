import 'package:flutter/material.dart';

class ExampleMobile extends StatelessWidget {
  const ExampleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ini mobile layout'),
      ),
      body: const Center(
        child: Text('ini contoh mobile'),
      ),
    );
  }
}