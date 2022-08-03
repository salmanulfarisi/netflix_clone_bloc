import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';

class CustomWidgetButton extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomWidgetButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
