import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReadOnlyDatePicker extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const ReadOnlyDatePicker({super.key, required this.onDateSelected});

  @override
  State<ReadOnlyDatePicker> createState() => _ReadOnlyDatePickerState();
}

class _ReadOnlyDatePickerState extends State<ReadOnlyDatePicker> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickDate,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Born Date',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(
          selectedDate != null
              ? DateFormat('dd MMMM yyyy').format(selectedDate!)
              : 'Select Date',
          style: TextStyle(
            color: selectedDate != null ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
