import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/widgets/app_bar.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: ((context, index) => _widgetList[index]),
          separatorBuilder: ((context, index) => const SizedBox(height: 25)),
          itemCount: _widgetList.length),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final List imageList = [
    'https://static.toiimg.com/thumb/msid-83036120,imgsize-508425,width-800,height-600,resizemode-75/83036120.jpg',
    'https://i.pinimg.com/originals/9e/98/83/9e9883a33f5bcbe252ff74b369e88d42.jpg',
    'https://file.cbbackgroundhd.com/uploads/preview/devil-movie-poster-photo-editing-background-hd-11638400361pzp8g7nzic.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of\nmovies and shows for you, so there'S\n is always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  radius: size.width * 0.4,
                ),
              ),
              DownloadImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 50),
                angle: 20,
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              DownloadImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 130, bottom: 50),
                angle: -20,
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              DownloadImageWidget(
                radius: 10,
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.45, size.width * 0.65),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kColorBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.settings, color: kwhiteColor),
        kwidth,
        Text('Smart Downloads',
            style: TextStyle(
              color: kwhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.radius = 10,
    this.angle = 0,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: kColorBlack,
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: NetworkImage(imageList),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
