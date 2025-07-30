import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  final void Function(String) onChanged;

  const GenderSelector({super.key, required this.onChanged});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender"),
        ListTile(
          title: Text("Man"),
          leading: Radio<String>(
            value: "Man",
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
              widget.onChanged(value!);
            },
          ),
        ),
        ListTile(
          title: Text("Woman"),
          leading: Radio<String>(
            value: "Woman",
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
              widget.onChanged(value!);
            },
          ),
        ),
      ],
    );
  }
}
