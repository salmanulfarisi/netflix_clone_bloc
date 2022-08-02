import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/search/widget/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/n6vVs6z8obNbExdD3QHTr4Utu1Z.jpg';

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
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemList(),
              separatorBuilder: (context, index) => kHeight2,
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemList extends StatelessWidget {
  const TopSearchItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
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
