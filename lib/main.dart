import 'package:flutter/material.dart';
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

                return Card(
                  child: ExpansionTile(
                    title: Text(movie.title),
                    subtitle: Text('Director: ${movie.director}'),
                    leading: CircleAvatar(
                      child: Text(movie.title[0]),
                    ),
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          left: 75,
                        ),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                        text: 'Released: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    TextSpan(text: '${movie.released} \n'),
                                    TextSpan(
                                        text: 'Plot: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    TextSpan(text: movie.plot),
                                  ]),
                            ),
                            TextButton(
                                onPressed: () {
                                  // Take to the movie details screen
                                  // use Navigator
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetails(movie: movie)));
                                },
                                child: const Text('Read More'))
                          ],
                        ),
                      )
                    ],
                  ),
                );

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
