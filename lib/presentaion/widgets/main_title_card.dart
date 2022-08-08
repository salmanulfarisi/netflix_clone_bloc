import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/widgets/main_card.dart';
import 'package:netflix_bloc/presentaion/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                posterList.length,
                (index) => MainCard(
                  imageUrl: posterList[index],
                ),
              )),
        ),
      ],
    );
  }
}
