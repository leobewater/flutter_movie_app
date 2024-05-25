import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/movie_card.dart';
import 'package:flutter_movie_app/models/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  // passing moving from the listing view
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Movie Details')),
        body: Container(
          child: Column(
            children: [MovieCard(movie: movie)],
          ),
        ));
  }
}
