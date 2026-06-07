import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final posterWidth = constraints.maxWidth > 500 ? 120.0 : 90.0;

          return Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    movie.posterUrl,
                    width: posterWidth,
                    height: posterWidth * 1.4,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Year: ${movie.year}'),
                      const SizedBox(height: 8),
                      Text('⭐ ${movie.rating}'),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        children: movie.genres.map((genre) {
                          return Chip(label: Text(genre));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
