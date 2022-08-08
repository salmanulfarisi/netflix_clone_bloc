import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/number_card.dart';
import 'package:netflix_bloc/presentaion/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> posterList;
  const NumberTitleCard({
    Key? key,
    required this.posterList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows in India Today'),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                posterList.length,
                (index) => NumberCard(
                  index: index,
                  imageUrl: posterList[index],
                ),
              )),
        ),
      ],
    );
  }
}
