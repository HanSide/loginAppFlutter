import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color myTextColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed, 
    required this.myTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,
          style: TextStyle(color: myTextColor),
        ),
      ),
    );
  }
}
