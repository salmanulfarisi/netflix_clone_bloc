import 'package:flutter/material.dart';
import 'package:netflix_bloc/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/domain/Downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // left side
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: kwhiteColor,
                          size: 30,
                        ))),
                //Right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage("$imageAppentUrl$posterPath"),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosNotifier,
                      builder: (BuildContext context, Set<int> newLIkedIds,
                          Widget? _) {
                        final _index = index;
                        if (newLIkedIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosNotifier.value.remove(_index);
                              likedVideosNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidgets(
                              icon: Icons.emoji_emotions,
                              title: 'Liked',
                              color: Colors.amber,
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosNotifier.value.add(_index);
                            likedVideosNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidgets(
                            icon: Icons.emoji_emotions,
                            title: 'Lol',
                            color: kwhiteColor,
                          ),
                        );
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: addedMyListNotifier,
                      builder: (BuildContext context, Set<int> newAddedMyList,
                          Widget? _) {
                        final _index = index;
                        if (newAddedMyList.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              addedMyListNotifier.value.remove(_index);
                              addedMyListNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidgets(
                                icon: Icons.add,
                                title: 'Listed',
                                color: Colors.amberAccent),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            addedMyListNotifier.value.add(_index);
                            addedMyListNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidgets(
                            icon: Icons.add,
                            title: 'My List',
                            color: kwhiteColor,
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .posterPath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionsWidgets(
                        icon: Icons.share,
                        title: 'Share',
                        color: kwhiteColor,
                      ),
                    ),
                    const VideoActionsWidgets(
                      icon: Icons.play_arrow,
                      title: 'play',
                      color: kwhiteColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  const VideoActionsWidgets(
      {Key? key, required this.icon, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kwhiteColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
