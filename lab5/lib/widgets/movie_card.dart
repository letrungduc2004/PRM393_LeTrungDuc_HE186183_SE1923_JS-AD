import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Hero(
            tag: movie.id,
            child: Image.network(
              movie.posterUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '⭐ ${movie.rating} • ${movie.genres.join(", ")}',
        ),
        trailing: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}