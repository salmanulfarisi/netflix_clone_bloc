import 'package:dartz/dartz.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:netflix_bloc/domain/hot_and_new_resp/models/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}
