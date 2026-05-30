import 'package:flutter/material.dart';

class CommonUIErrorsDemo extends StatefulWidget {
  const CommonUIErrorsDemo({super.key});

  @override
  State<CommonUIErrorsDemo> createState() => _CommonUIErrorsDemoState();
}

class _CommonUIErrorsDemoState extends State<CommonUIErrorsDemo> {
  final List<String> movies = [
    'Movie A',
    'Movie B',
    'Movie C',
    'Movie D',
  ];

  int counter = 0;

  DateTime? selectedDate;

  Future<void> pickDate() async {
    // Gọi DatePicker từ widget tree hợp lệ
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Errors'),
      ),

      // SingleChildScrollView giúp tránh overflow trên màn hình nhỏ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Correct ListView inside Column using Expanded',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Fix lỗi ListView trong Column bằng Expanded
                Expanded(
                  child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.movie),
                        title: Text(movies[index]),
                      );
                    },
                  ),
                ),

                const Divider(),

                Text(
                  'Counter: $counter',
                  style: const TextStyle(fontSize: 18),
                ),

                ElevatedButton(
                  onPressed: () {
                    // Fix lỗi UI không cập nhật bằng setState()
                    setState(() {
                      counter++;
                    });
                  },
                  child: const Text('Increase Counter'),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: pickDate,
                  child: const Text('Open Date Picker'),
                ),

                const SizedBox(height: 10),

                Text(
                  selectedDate == null
                      ? 'No date selected'
                      : 'Selected Date: '
                      '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}