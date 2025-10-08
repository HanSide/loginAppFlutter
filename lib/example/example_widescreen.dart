import 'package:flutter/material.dart';

class ExampleWidescreen extends StatelessWidget {
  const ExampleWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ini Widescreen layout'),
      ),
      body: const Center(
        child: Text('ini contoh Widescreen layout '),
      ),
    );
  }
}