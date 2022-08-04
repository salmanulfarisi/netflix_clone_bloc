import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}
