import 'package:dio/dio.dart';
import 'package:tp3/models/movie_model.dart';

class Api {
  final Dio _dio = Dio();
  final String apiKey = '13f5118cb4b4d0bbd1deff95009c07d8';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future <List<Result>> getPopularMovies({int page = 1}) async{
    final response = await _dio.get(
      '$baseUrl/movie/popular',
      queryParameters: {
        'api_key': apiKey,
        'language': 'pt-BR',
        'page': page,
      },
    );

    if(response.statusCode == 200){
      final movieModel = MovieModel.fromJson(response.data);
      return movieModel.results;
    } else{
      throw Exception('Erro ao buscar os filmes');
    }
  }
  
}