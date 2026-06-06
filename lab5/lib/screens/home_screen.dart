import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../screens/movie_detail_screen.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return MovieCard(
            movie: movie,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      MovieDetailScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}