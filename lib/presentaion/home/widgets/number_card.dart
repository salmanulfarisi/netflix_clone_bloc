import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  const NumberCard({Key? key, required this.index, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 12,
          top: 79,
          child: BorderedText(
              strokeWidth: 5.0,
              strokeColor: kwhiteColor,
              child: Text('${index + 1}',
                  style: const TextStyle(
                      fontSize: 120,
                      color: kColorBlack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      decorationColor: kColorBlack))),
        ),
      ],
    );
  }
}
