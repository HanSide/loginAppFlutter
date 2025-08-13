import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String myText;
  final Color myTextColor;
  final double size;
  final FontWeight type;

  const CustomText({
    super.key,
    required this.myText,
    this.myTextColor = Colors.black,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        myText,
        style: TextStyle(
          fontSize: size,
          fontWeight: type,
          color: myTextColor,
        ),
      ),
    );
  }
}