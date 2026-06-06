import '../models/movie.dart';
import '../models/trailer.dart';

final List<Movie> movies = [
  Movie(
    id: 1,
    title: 'Dune: Part Two',
    posterUrl:
        'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=1200',
    rating: 8.6,
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    trailers: const [
      Trailer(title: 'Official Trailer #1'),
      Trailer(title: 'Official Trailer #2'),
      Trailer(title: 'IMAX Sneak Peek'),
    ],
  ),
  Movie(
    id: 2,
    title: 'Deadpool & Wolverine',
    posterUrl:
        'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=1200',
    rating: 8.3,
    genres: ['Action', 'Comedy'],
    overview:
        'Deadpool teams up with Wolverine in a chaotic multiverse adventure packed with action and humor.',
    trailers: const [
      Trailer(title: 'Main Trailer'),
      Trailer(title: 'Behind The Scenes'),
      Trailer(title: 'Final Trailer'),
    ],
  ),
  Movie(
    id: 3,
    title: 'Interstellar',
    posterUrl:
        'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=1200',
    rating: 8.7,
    genres: ['Sci-Fi', 'Adventure', 'Mystery'],
    overview:
        'A group of explorers travel through a wormhole in space in an attempt to ensure humanity’s survival.',
    trailers: const [
      Trailer(title: 'Official Trailer'),
      Trailer(title: 'Launch Sequence'),
      Trailer(title: 'Behind The Music'),
    ],
  ),
];
