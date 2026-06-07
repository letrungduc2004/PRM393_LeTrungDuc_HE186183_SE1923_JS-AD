import 'package:flutter/material.dart';

import '../data/movie_data.dart';
import '../enums/sort_option.dart';
import '../models/movie.dart';

import '../widgets/movie_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/genre_filter.dart';
import '../widgets/sort_dropdown.dart';

class MovieBrowserScreen extends StatefulWidget {
  const MovieBrowserScreen({super.key});

  @override
  State<MovieBrowserScreen> createState() => _MovieBrowserScreenState();
}

class _MovieBrowserScreenState extends State<MovieBrowserScreen> {
  String searchQuery = '';

  SortOption selectedSort = SortOption.az;

  final Set<String> selectedGenres = {};

  final List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Adventure',
    'Animation',
  ];

  List<Movie> getVisibleMovies() {
    final movies = allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final matchesGenre =
          selectedGenres.isEmpty ||
          movie.genres.any((genre) => selectedGenres.contains(genre));

      return matchesSearch && matchesGenre;
    }).toList();

    switch (selectedSort) {
      case SortOption.az:
        movies.sort((a, b) => a.title.compareTo(b.title));
        break;

      case SortOption.za:
        movies.sort((a, b) => b.title.compareTo(a.title));
        break;

      case SortOption.year:
        movies.sort((a, b) => b.year.compareTo(a.year));
        break;

      case SortOption.rating:
        movies.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return movies;
  }

  void toggleGenre(String genre) {
    setState(() {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final visibleMovies = getVisibleMovies();

    return Scaffold(
      appBar: AppBar(title: const Text('Find a Movie')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBarWidget(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              GenreFilter(
                genres: genres,
                selectedGenres: selectedGenres,
                onGenreTapped: toggleGenre,
              ),

              const SizedBox(height: 16),

              SortDropdown(
                selectedSort: selectedSort,
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    selectedSort = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: visibleMovies[index]);
                        },
                      );
                    }

                    return GridView.builder(
                      itemCount: visibleMovies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2.2,
                          ),
                      itemBuilder: (context, index) {
                        return MovieCard(movie: visibleMovies[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
