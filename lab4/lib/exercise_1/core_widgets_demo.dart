import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 – Core Widgets')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headline Text
              const Text(
                'Welcome to Flutter UI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 40),

              // Material Icon
              const Center(
                child: Icon(Icons.movie, size: 80, color: Colors.blue),
              ),

              const SizedBox(height: 30),

              // Network Image
              Image.network(
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              // Card + ListTile
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Movie Item'),
                  subtitle: Text('This is a sample ListTile inside a Card.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
