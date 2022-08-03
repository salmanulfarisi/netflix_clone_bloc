import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kMainImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomWidgetButton(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomWidgetButton(
                  icon: Icons.info,
                  title: 'Info',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
      color: kColorBlack,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text('Play',
          style: TextStyle(
            fontSize: 20,
            color: kColorBlack,
          )),
    ),
  );
}
