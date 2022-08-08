import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:netflix_bloc/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix_bloc/domain/hot_and_new_resp/models/hot_and_new_resp.dart';

part 'hot_andnew_event.dart';
part 'hot_andnew_state.dart';
part 'hot_andnew_bloc.freezed.dart';

@injectable
class HotAndnewBloc extends Bloc<HotAndnewEvent, HotAndnewState> {
  final HotAndNewService _hotAndNewService;
  HotAndnewBloc(this._hotAndNewService) : super(HotAndnewState.initial()) {
    /*
    get hot and new movie data
    
    */
    on<LoadDataInComingSoon>((event, emit) async {
      // send loading event to ui
      emit(const HotAndnewState(
        comingsoonList: [],
        everyOneWatchingList: [],
        isLoading: true,
        hasError: false,
      ));
      // get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      // data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndnewState(
            comingsoonList: [],
            everyOneWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndnewState(
            comingsoonList: resp.results,
            everyOneWatchingList: state.everyOneWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      log(newState.toString());
      emit(newState);
    });

    /*
    get hot and new tv data
    */
    on<LoadDataInEveryOneIsWatching>((event, emit) async {
      emit(const HotAndnewState(
        comingsoonList: [],
        everyOneWatchingList: [],
        isLoading: true,
        hasError: false,
      ));
      // get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();
      // data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndnewState(
            comingsoonList: [],
            everyOneWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndnewState(
            comingsoonList: state.comingsoonList,
            everyOneWatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      log(newState.toString());
      emit(newState);
    });
  }
}
