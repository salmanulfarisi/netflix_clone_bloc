import 'package:netflix_bloc/core/strings.dart';
import 'package:netflix_bloc/infrastructure/api_key.dart';

class ApiEndPoints {
  static const kDownloads = "$baseUrl/trending/all/day?api_key=$apiKey";
  static const kSearch = "$baseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = "$baseUrl/discover/movie?api_key=$apiKey";
  static const hotAndNewTv = "$baseUrl/discover/tv?api_key=$apiKey";
}
