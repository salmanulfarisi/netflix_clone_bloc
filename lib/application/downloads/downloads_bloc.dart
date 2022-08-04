import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';
import 'package:netflix_bloc/domain/core/failures/main_failure.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccess: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      emit(downloadsOption.fold(
          //left
          (failure) => state.copyWith(
                isLoading: false,
                downloadsFailureOrSuccess: Some(Left(failure)),
              ),
          //right
          (success) => state.copyWith(
                isLoading: false,
                downloads: success,
                downloadsFailureOrSuccess: Some(Right(success)),
              )));
    });
  }
}
