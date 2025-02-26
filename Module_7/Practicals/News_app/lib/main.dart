import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieSearchScreen(),
    );
  }
}

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  _MovieSearchScreenState createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Movie> _movies = [];
  bool _isLoading = false;

  // Function to search movies using the API
  Future<void> _searchMovies(String query) async {
    if (query.isEmpty) return; // Do nothing if query is empty

    final apiKey = 'b8d3f58e8f56aec3baba7b05ef3d752e'; // Your TMDb API Key
    final url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query');

    setState(() {
      _isLoading = true;
      _movies = []; // Reset previous movies
    });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _movies = (data['results'] as List)
              .map((movieData) => Movie.fromJson(movieData))
              .toList();
        });
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter movie name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _searchMovies, // Trigger search on submit
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator() // Show loading indicator while fetching data
                : Expanded(
                    child: ListView.builder(
                      itemCount: _movies.length,
                      itemBuilder: (context, index) {
                        final movie = _movies[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: movie.posterPath != null
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w92${movie.posterPath}')
                              : const Icon(Icons.movie),
                          title: Text(movie.title),
                          subtitle: Text(movie.overview),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// Movie model to parse JSON response
class Movie {
  final String title;
  final String overview;
  final String? posterPath;

  Movie({required this.title, required this.overview, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}
