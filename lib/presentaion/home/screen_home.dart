import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/number_title_card.dart';
import 'package:netflix_bloc/presentaion/widgets/background_card.dart';
import 'package:netflix_bloc/presentaion/widgets/main_title_card.dart';

ValueNotifier<bool> scrolNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrolNotifier,
        builder: (BuildContext context, index, Widget? _) {
          //scroll direction detection
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrolNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrolNotifier.value = true;
              }
              return true;
            }),
            child: Stack(
              children: [
                ListView(
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
                ),
                scrolNotifier.value == true
                    ? AnimatedContainer(
                        width: double.infinity,
                        height: 100,
                        color: kColorBlack.withOpacity(0.5),
                        duration: const Duration(milliseconds: 1000),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                  width: 70,
                                  height: 70,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: kwhiteColor,
                                  size: 30,
                                ),
                                kwidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TV Shows", style: kHomeTitleTextStyle),
                                Text("Movies", style: kHomeTitleTextStyle),
                                Text("Categories", style: kHomeTitleTextStyle),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
