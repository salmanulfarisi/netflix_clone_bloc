import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_bloc/application/search/search_bloc.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/search/widget/title.dart';

// const imageUrl =
//     'https://static.toiimg.com/thumb/msid-83036120,imgsize-508425,width-800,height-600,resizemode-75/83036120.jpg';

class SearchIdleWIdjet extends StatelessWidget {
  const SearchIdleWIdjet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text("Error while getting data"));
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text("List is Empty"));
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemList(
                        title: movie.title ?? "No title Provided",
                        imageUrl: '$imageAppentUrl${movie.posterPath}');
                  },
                  separatorBuilder: (context, index) => kHeight2,
                  itemCount: state.idleList.length);
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemList extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemList(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kColorBlack,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
