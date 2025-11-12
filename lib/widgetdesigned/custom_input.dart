import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
  String label, {
  bool isNumber = false,
}) {
  return TextField(
    controller: controller,
    keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
  );
}

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
   final Widget? prefixIcon;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
