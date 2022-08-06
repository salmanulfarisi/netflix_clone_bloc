import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';
import 'package:netflix_bloc/domain/core/failures/main_failures.dart';
import 'package:netflix_bloc/domain/search/models/search_repo/search_repo.dart';
import 'package:netflix_bloc/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    /*
 idle state
 */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false),
        );
        return;
      }
      emit(
        const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );
      //get Trending
      final _result = await _downloadsService.getDownloadsImage();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idleList: list,
              isLoading: false,
              isError: false);
        },
      );
      //show to Ui
      emit(_state);
    });
    /*
 search result state
 */
    on<SearchMovie>((event, emit) async {
      // call search movie api
      log('Searching for ${event.movieQuery}');
      emit(
        const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (SearchRepo r) {
          return SearchState(
              searchResultList: r.results,
              idleList: [],
              isLoading: false,
              isError: false);
        },
      );

      // show to Ui
      emit(_state);
    });
  }
}
