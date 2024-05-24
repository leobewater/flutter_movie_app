import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final List<String> _movieList = [
    "The Shark",
    "The Godfather",
    "The Dark Knight",
    "The Godfather II",
    "The Lord of the Ring",
    "Pulp Fiction",
    "Schindler's List"
  ];

  List<String> get movieList => _movieList;
  
  List<String> loadMovies() {
    return _movieList;
  }
}
