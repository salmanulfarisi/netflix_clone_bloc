import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier<Set<int>> likedVideosNotifier = ValueNotifier({});
ValueNotifier<Set<int>> addedMyListNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending loading to ui
      emit(const FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      // get trending movies
      final result = await _downloadService.getDownloadsImage();
      final _state = result.fold(
        (l) {
          return const FastLaughState(
            videosList: [],
            isLoading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        ),
      );

      // send to ui
      emit(_state);
    });
    on<LikeVideo>((event, emit) async {
      likedVideosNotifier.value.add(event.id);
      likedVideosNotifier.notifyListeners();
    });

    on<UnLikedVideo>((event, emit) async {
      likedVideosNotifier.value.remove(event.id);
      likedVideosNotifier.notifyListeners();
    });
    on<AddedMyList>((event, emit) async {
      addedMyListNotifier.value.add(event.id);
      addedMyListNotifier.notifyListeners();
    });

    on<NotaddedMyList>((event, emit) async {
      addedMyListNotifier.value.remove(event.id);
      addedMyListNotifier.notifyListeners();
    });
  }
}
