import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import 'pages/movie_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // initState before insert to tree
    // load movies
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get the movieList
    final movieData = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: Center(
          child: ListView.builder(
              itemCount: movieData.movieList.length, // limit to number of items
              itemBuilder: (context, index) {
                final movie = movieData.movieList[index];

                return MovieCard(movie: movie);

                // return ListTile(
                //   title: Text(movie.title),
                //   subtitle: const Text('sub'),
                //   trailing: const Icon(Icons.sunny),
                //   leading: CircleAvatar(
                //     child: Text(movie.title[0]),
                //   ),
                // );
              })),
    );
  }
}
