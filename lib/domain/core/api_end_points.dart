import 'package:netflix_bloc/core/strings.dart';
import 'package:netflix_bloc/infrastructure/api_key.dart';

class ApiEndPoints {
  static const kDownloads = "$baseUrl/trending/all/day?api_key=$apiKey";
}
