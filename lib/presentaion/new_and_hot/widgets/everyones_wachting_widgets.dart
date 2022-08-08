import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/video_widgets.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryoneWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kHeight,
      Text(
        movieName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      kHeight,
      Text(
        description,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: kColorGrey,
        ),
      ),
      kHeight50,
      VideoWidget(
        url: posterPath,
      ),
      kHeight,
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          CustomWidgetButton(
            icon: Icons.share,
            title: 'Share',
            iconsize: 25,
            fontsize: 16,
          ),
          kwidth,
          CustomWidgetButton(
            icon: Icons.add,
            title: 'My List',
            iconsize: 25,
            fontsize: 16,
          ),
          kwidth,
          CustomWidgetButton(
            icon: Icons.play_arrow,
            title: 'Play',
            iconsize: 25,
            fontsize: 16,
          ),
          kwidth,
        ],
      )
    ]);
  }
}
