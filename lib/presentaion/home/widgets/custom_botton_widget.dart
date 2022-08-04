import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';

class CustomWidgetButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconsize;
  final double fontsize;
  const CustomWidgetButton({
    Key? key,
    required this.icon,
    required this.title,
    this.iconsize = 30,
    this.fontsize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontsize,
          ),
        ),
      ],
    );
  }
}
