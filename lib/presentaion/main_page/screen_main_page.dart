import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/presentaion/downloads/screen_downloads.dart';
import 'package:netflix_bloc/presentaion/fast_laugs/screen_fast_laugs.dart';
import 'package:netflix_bloc/presentaion/home/Screen_home.dart';
import 'package:netflix_bloc/presentaion/main_page/widgets/bottom_nav.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_bloc/presentaion/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownload()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChange,
          builder: (BuildContext context, int index, Widget? _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
