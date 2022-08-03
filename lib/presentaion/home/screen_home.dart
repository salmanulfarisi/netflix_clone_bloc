import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';
import 'package:netflix_bloc/presentaion/home/widgets/number_title_card.dart';
import 'package:netflix_bloc/presentaion/widgets/background_card.dart';
import 'package:netflix_bloc/presentaion/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: const [
            BackgroundCard(),
            MainTitleCard(title: 'Released in the past yeat'),
            kHeight,
            MainTitleCard(title: 'Trending Now'),
            kHeight,
            NumberTitleCard(),
            kHeight,
            MainTitleCard(title: 'Tense Dramas'),
            kHeight,
            MainTitleCard(title: 'South Indian Cinemas'),
            kHeight,
          ],
        ),
      ],
    ));
  }
}
