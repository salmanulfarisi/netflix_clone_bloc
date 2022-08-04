import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/core/api_end_points.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';

@lazySingleton
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.kDownloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadList = [];
        for (final raw in response.data) {
          downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
