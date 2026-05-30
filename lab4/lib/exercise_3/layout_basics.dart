import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  // Danh sách phim mẫu
  final List<String> movies = const [
    'Avatar',
    'Inception',
    'Interstellar',
    'Joker',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
      ),

      body: Column(
        children: [

          // Tiêu đề
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Danh sách phim
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: movies.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),

                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),

                      leading: CircleAvatar(
                        child: Text(
                          movies[index][0],
                        ),
                      ),

                      title: Text(
                        movies[index],
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),

                      subtitle: const Text(
                        'Sample description',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}