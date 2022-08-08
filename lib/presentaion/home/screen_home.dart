import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_bloc/application/home/home_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text('Error while getting data'),
                      );
                    }
                    // release past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppentUrl${m.posterPath}';
                    }).toList();
                    // trending
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppentUrl${m.posterPath}';
                    }).toList();
                    // tense drams
                    final _tenseDramas = state.tenseDramaMovieList.map((m) {
                      return '$imageAppentUrl${m.posterPath}';
                    }).toList();
                    // South indian
                    final _southIndian = state.southIndianMovieList.map((m) {
                      return '$imageAppentUrl${m.posterPath}';
                    }).toList();
                    //  top 10 tv shows
                    final _top10TvShows = state.trendingTvList.map((m) {
                      return '$imageAppentUrl${m.posterPath}';
                    }).toList();
                    _top10TvShows.shuffle();
                    // Listview
                    return ListView(
                      children: [
                        Column(
                          children: [
                            const BackgroundCard(),
                            MainTitleCard(
                              title: 'Released in the past yeat',
                              posterList: _releasedPastYear.sublist(0, 10),
                            ),
                            kHeight,
                            MainTitleCard(
                              title: 'Trending Now',
                              posterList: _trending.sublist(0, 10),
                            ),
                            kHeight,
                            NumberTitleCard(
                              posterList: _top10TvShows.sublist(0, 10),
                            ),
                            kHeight,
                            MainTitleCard(
                              title: 'Tense Dramas',
                              posterList: _tenseDramas.sublist(0, 10),
                            ),
                            kHeight,
                            MainTitleCard(
                              title: 'South Indian Cinemas',
                              posterList: _southIndian.sublist(0, 10),
                            ),
                            kHeight,
                          ],
                        ),
                      ],
                    );
                  },
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
