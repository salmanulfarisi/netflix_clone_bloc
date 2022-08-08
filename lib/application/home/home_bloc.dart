import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:netflix_bloc/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix_bloc/domain/hot_and_new_resp/models/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;

  HomeBloc(this._homeService) : super(HomeState.initial()) {
    /*
    on event get homescreen data
    */
    on<HomeEvent>((event, emit) async {
      // send loading to Ui
      emit(state.copyWith(isLoading: true, hasError: false));
      // get data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewMovieData();
      // transform data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final tenseDrama = resp.results;
          final southIndian = resp.results;
          pastYear.shuffle();
          trending.shuffle();
          tenseDrama.shuffle();
          southIndian.shuffle();
          return HomeState(
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramaMovieList: tenseDrama,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          );
        },
      );
      emit(_state1);
      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return HomeState(
              pastYearMovieList: state.pastYearMovieList,
              trendingMovieList: state.trendingMovieList,
              tenseDramaMovieList: state.tenseDramaMovieList,
              southIndianMovieList: state.southIndianMovieList,
              trendingTvList: top10List,
              isLoading: false,
              hasError: false,
              stateId: '');
        },
      );
      // send data to ui
      emit(_state2);
    });
  }
}
