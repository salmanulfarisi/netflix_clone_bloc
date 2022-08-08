part of 'hot_andnew_bloc.dart';

@freezed
class HotAndnewState with _$HotAndnewState {
  const factory HotAndnewState({
    required List<HotAndNewData> comingsoonList,
    required List<HotAndNewData> everyOneWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndnewState.initial() => const HotAndnewState(
        comingsoonList: [],
        everyOneWatchingList: [],
        isLoading: false,
        hasError: false,
      );
}
