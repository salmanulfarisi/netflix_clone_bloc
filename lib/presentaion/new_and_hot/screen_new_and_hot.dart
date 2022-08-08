import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_bloc/application/hot_and_new/hot_andnew_bloc.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/comingsoon_widgets.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/everyones_wachting_widgets.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: Text('New & Hot',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                )),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
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
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: kwhiteColor,
                labelColor: kColorBlack,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(text: '🍿Coming Soon'),
                  Tab(text: "👀Everyone's watching"),
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(key: Key('ComingSoonList')),
          EveryOneIsWatchingList(
            key: Key('EveryOneIsWacthng'),
          ),
        ]),
      ),
    );
  }

  // Widget _buildComingsoon() {
  //   return ListView.builder(itemBuilder: (context, index) {
  //     return const ComingsoonWidget();
  //   });
  // }

//   Widget _buildEveryoneWathcing(String s) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (BuildContext context, int index) {
//         return const SizedBox();
//       },
//     );
//   }
// }

}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndnewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndnewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndnewBloc, HotAndnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading Coming Soon List'));
          } else if (state.comingsoonList.isEmpty) {
            return const Center(child: Text('Coming Soon List is Empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: state.comingsoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingsoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  String month = '';
                  String day = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formateDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formateDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    day = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    day = '';
                  }

                  return ComingsoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: day,
                    posterPath: '$imageAppentUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    description: movie.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndnewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndnewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndnewBloc, HotAndnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading Everyone wacthing List'));
          } else if (state.everyOneWatchingList.isEmpty) {
            return const Center(child: Text('Everyone wacthing List is Empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.everyOneWatchingList.length,
                itemBuilder: (context, index) {
                  final movie = state.everyOneWatchingList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  final tv = state.everyOneWatchingList[index];
                  return EveryoneWatchingWidget(
                    posterPath: '$imageAppentUrl${tv.posterPath}',
                    movieName: tv.originalName ?? 'No Title',
                    description: tv.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}
