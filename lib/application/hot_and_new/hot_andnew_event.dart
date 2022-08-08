part of 'hot_andnew_bloc.dart';

@freezed
class HotAndnewEvent with _$HotAndnewEvent {
  const factory HotAndnewEvent.loadDataInComingSoon() = LoadDataInComingSoon;
  const factory HotAndnewEvent.loadDataInEveryOneIsWatching() =
      LoadDataInEveryOneIsWatching;
}
