import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState
    extends State<MovieDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: movie.id,
                  child: Image.network(
                    movie.posterUrl,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 20,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 8,
                children: movie.genres
                    .map(
                      (genre) => Chip(
                    label: Text(genre),
                  ),
                )
                    .toList(),
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),
                    const Text('Favorite'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.star),
                    ),
                    const Text('Rate'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                    const Text('Share'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Trailers',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              itemCount: movie.trailers.length,
              separatorBuilder: (_, __) =>
              const Divider(),
              itemBuilder: (context, index) {
                final trailer =
                movie.trailers[index];

                return ListTile(
                  leading: const Icon(
                    Icons.play_circle_fill,
                  ),
                  title: Text(
                    trailer.title,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}