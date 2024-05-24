import 'dart:convert';

import 'package:flutter_movie_app/models/movie.dart';

class MovieParser {
  static List<Movie> parse(String jsonString) {
    final List<dynamic> parsedJsonList = json.decode(jsonString);

    // cast jsonItem as Map<String, dynamic>
    // cast the array to list()
    return parsedJsonList
        .map((jsonItem) => Movie.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
