import 'package:flutter/material.dart';
import 'screens/movie_browser_screen.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Browser',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const MovieBrowserScreen(),
    );
  }
}
