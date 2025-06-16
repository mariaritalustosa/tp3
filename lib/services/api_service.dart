import 'package:dio/dio.dart';
import 'package:tp3/models/movie_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = "13f5118cb4b4d0bbd1deff95009c07d8";

  Future<List<Movie>> fetchPopularMovies({int page = 1}) async{
    final response = await _dio.get(
      '$_baseUrl/movie/popular',
      queryParameters: {
        'api_key': _apiKey,
        'language': 'pt-BR',
        'page': page,
      },
    );

    if(response.statusCode == 200){
      final results = response.data['results'] as List;
      return results.map((json) => Movie.fromJson(json)).toList();
    } else{
      throw Exception('Erro ao buscar filmes');
    }
  }
}