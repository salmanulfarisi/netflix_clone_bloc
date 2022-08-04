import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/home/widgets/custom_botton_widget.dart';
import 'package:netflix_bloc/presentaion/new_and_hot/widgets/video_widgets.dart';

class ComingsoonWidget extends StatelessWidget {
  const ComingsoonWidget({
    Key? key,
  }) : super(key: key);

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
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: kColorGrey,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
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
              const VideoWidget(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tall GIRL 2',
                    style: TextStyle(
                        letterSpacing: -5,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomWidgetButton(
                        icon: Icons.notifications,
                        title: 'Remind Me',
                        iconsize: 20,
                        fontsize: 12,
                      ),
                      kwidth,
                      CustomWidgetButton(
                        icon: Icons.info,
                        title: 'Info',
                        iconsize: 20,
                        fontsize: 12,
                      ),
                      kwidth,
                    ],
                  ),
                ],
              ),
              const Text("Coming on Friday"),
              kHeight,
              const Text(
                "Tall Girl 2",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Landing the lead in the school musical is a dream come true for jodi, until the presure sends her confidence -and her relationship-into a tailspin.",
                style: TextStyle(
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
