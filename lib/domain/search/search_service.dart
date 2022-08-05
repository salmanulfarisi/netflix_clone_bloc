import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:netflix_bloc/domain/search/models/search_repo/search_repo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRepo>> searchMovies({
    required String movieQuery,
  });
}
