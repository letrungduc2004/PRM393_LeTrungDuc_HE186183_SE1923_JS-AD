import 'package:flutter/material.dart';

class GenreFilter extends StatelessWidget {
  final List<String> genres;
  final Set<String> selectedGenres;
  final Function(String) onGenreTapped;

  const GenreFilter({
    super.key,
    required this.genres,
    required this.selectedGenres,
    required this.onGenreTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.map((genre) {
        return FilterChip(
          label: Text(genre),
          selected: selectedGenres.contains(genre),
          onSelected: (_) => onGenreTapped(genre),
        );
      }).toList(),
    );
  }
}
