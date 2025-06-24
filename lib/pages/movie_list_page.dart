import 'package:flutter/material.dart';
import 'package:tp3/models/movie_model.dart';
import 'package:tp3/services/api_service.dart';
import 'package:tp3/pages/movie_details_page.dart';

class MovieListPage extends StatefulWidget{
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State <MovieListPage>{
  late Future<List<Movie>> _futureMovies;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureMovies = _apiService.fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes Populares')),
        body: FutureBuilder(
          future: _futureMovies,
           builder: (context,snapshot){
             if(!snapshot.hasData || snapshot.data!.isEmpty){
              return Center(
                child: Text('Nenhum filme encontrado'),
              );
            } else{
              final movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                   return ListTile(
                  leading: movie.posterPath != null
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w92${movie.posterPath!}',
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.movie),
                  title: Text(movie.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.overview.length > 100
                      ? '${movie.overview.substring(0, 100)}...'
                      : movie.overview,
                    style: const TextStyle(fontSize: 12),
                      ),
                     const SizedBox(height: 3),
                     Text('Nota: ${movie.voteAverage.toStringAsFixed(1)}'),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MovieDetailsPage(movie: movie),
                      ),
                      );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}