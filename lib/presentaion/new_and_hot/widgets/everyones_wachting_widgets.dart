import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/video_widgets.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kHeight,
      const Text(
        "Friends",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      kHeight,
      const Text(
        "This hit sitcom follows the merry misadvantures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
        style: TextStyle(
          color: kColorGrey,
        ),
      ),
      kHeight50,
      const VideoWidget(),
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
