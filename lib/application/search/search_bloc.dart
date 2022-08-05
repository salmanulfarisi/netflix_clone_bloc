import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_bloc/domain/Downloads/i_downloads_repo.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';
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
    on<Initialize>((event, emit) {
      //get Trending
      _downloadsService.getDownloadsImage();
      //show to Ui
    });
    /*
 search result state
 */
    on<SearchMovie>((event, emit) {
      // call search movie api
      _searchService.searchMovies(movieQuery: event.movieQuery);
      // show to Ui
    });
  }
}
