import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/core/api_end_points.dart';
import 'package:netflix_bloc/domain/search/models/search_repo/search_repo.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchRepo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.kSearch, queryParameters: {'query': movieQuery});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
