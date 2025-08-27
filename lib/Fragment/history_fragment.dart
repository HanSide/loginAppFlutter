import 'package:flutter/material.dart';

class HistoryFragment extends StatelessWidget {
  const HistoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "History Fragment",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}