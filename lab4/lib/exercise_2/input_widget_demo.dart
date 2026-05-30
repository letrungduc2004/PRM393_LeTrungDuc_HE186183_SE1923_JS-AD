import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // Giá trị của Slider
  double _rating = 50;

  // Giá trị của Switch
  bool _isActive = false;

  // Giá trị Radio được chọn
  String? _selectedGenre;

  // Ngày được chọn từ DatePicker
  DateTime? _selectedDate;

  // Hàm mở DatePicker
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView(
          children: [
            // =====================
            // Slider Section
            // =====================
            const Text(
              'Rating (Slider)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Slider(
              min: 0,
              max: 100,
              value: _rating,
              divisions: 100,
              label: _rating.round().toString(),
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
            ),

            Text(
              'Current value: ${_rating.round()}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // =====================
            // Switch Section
            // =====================
            const Text(
              'Active (Switch)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SwitchListTile(
              title: const Text('Is movie active?'),
              value: _isActive,
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),

            Text(
              'Status: ${_isActive ? "Active" : "Inactive"}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // =====================
            // RadioListTile Section
            // =====================
            const Text(
              'Genre (RadioListTile)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
            ),

            Text(
              'Selected genre: ${_selectedGenre ?? "None"}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // =====================
            // Date Picker Section
            // =====================
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Open Date Picker'),
            ),

            const SizedBox(height: 20),

            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: '
                        '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
