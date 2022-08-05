import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/core/api_end_points.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepositary implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.kDownloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        // final List<Downloads> downloadsList = [];
        // for (final raw in Response.data) {
        //   downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
// import 'package:netflix_bloc/domain/core/api_end_points.dart';
// import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';
// import 'package:netflix_bloc/domain/core/failures/main_failures.dart';

// @LazySingleton(as: IDownloadsRepo)
// class DownloadsRepository implements IDownloadsRepo {
//   @override
//   Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
//     try {
//       final Response response =
//           await Dio(BaseOptions()).get(ApiEndPoints.kDownloads);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final List<Downloads> downloadList = [];
//         for (final raw in response.data) {
//           downloadList.add(Downloads.fromJson(raw as Map<String, dynamic>));
//         }
//         print(downloadList);
//         return Right(downloadList);
//       } else {
//         return const Left(MainFailures.serverFailure());
//       }
//     } catch (_) {
//       return const Left(MainFailures.clientFailure());
//     }
//   }
// }
