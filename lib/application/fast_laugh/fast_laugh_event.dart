part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.likeVideo({required int id}) = LikeVideo;
  const factory FastLaughEvent.unLikedVideo({required int id}) = UnLikedVideo;
  const factory FastLaughEvent.addedMyList({required int id}) = AddedMyList;
  const factory FastLaughEvent.notaddedMyList({required int id}) =
      NotaddedMyList;
}
