import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movieList = [
    // "The Shark",
    // "The Godfather",
    // "The Dark Knight",
    // "The Godfather II",
    // "The Lord of the Ring",
    // "Pulp Fiction",
    // "Schindler's List"
  ];

  List<Movie> get movieList => _movieList;

  Future<void> loadMovies(BuildContext context) async {
    try {
      // load json file
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/films.json');

      // parse json to Movie object
      final movies = MovieParser.parse(jsonString);

      _movieList = movies;

      notifyListeners();
    } catch (e) {
      debugPrint('Error loading movies: $e');
    }
  }
  
  // List<String> loadMovies() {
  //   return _movieList;
  // }
}
