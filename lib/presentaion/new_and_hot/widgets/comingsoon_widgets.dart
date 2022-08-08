import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/video_widgets.dart';

class ComingsoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingsoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: kColorGrey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          // letterSpacing: -5,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const Spacer(),
                  const CustomWidgetButton(
                    icon: Icons.notifications,
                    title: 'Remind Me',
                    iconsize: 20,
                    fontsize: 12,
                  ),
                  kwidth,
                  const CustomWidgetButton(
                    icon: Icons.info,
                    title: 'Info',
                    iconsize: 20,
                    fontsize: 12,
                  ),
                  kwidth,
                ],
              ),
              Text("Coming on $day $month",
                  style: const TextStyle(
                    color: kColorGrey,
                  )),
              kHeight,
              Text(
                movieName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kColorGrey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
