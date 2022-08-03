import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          image: NetworkImage(
              'https://static.toiimg.com/thumb/msid-83036120,imgsize-508425,width-800,height-600,resizemode-75/83036120.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
