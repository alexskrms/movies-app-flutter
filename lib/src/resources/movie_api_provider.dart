import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_flutter/src/models/movie_item.dart';

class MovieApiProvider {
  final _apiKey = "9b41fd63ee18bf4d9e0f33d87ba76a23";
  final _baseUrl = "api.themoviedb.org";

  Future<MovieItem> getMovieList() async {
    final urlPopularMovies = '/3/movie/popular';
    var queryParameters = {
      'api_key': _apiKey
    };
    final response = await http.get(Uri.https(_baseUrl, urlPopularMovies, queryParameters));
    if(response.statusCode == 200){
      return MovieItem.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to get movies");
    }
  }
}