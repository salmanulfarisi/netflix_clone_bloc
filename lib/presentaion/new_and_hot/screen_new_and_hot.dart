import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/comingsoon_widgets.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/everyones_wachting_widgets.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/video_widgets.dart';
import 'package:netflix_bloc/presentaion/widgets/app_bar.dart';

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
        body: TabBarView(children: [
          _buildComingsoon(),
          _buildEveryoneWathcing('Everyones Watching'),
        ]),
      ),
    );
  }

  Widget _buildComingsoon() {
    return ListView.builder(itemBuilder: (context, index) {
      return const ComingsoonWidget();
    });
  }

  Widget _buildEveryoneWathcing(String s) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const EveryoneWatchingWidget();
      },
    );
  }
}
