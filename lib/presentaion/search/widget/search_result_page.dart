import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_bloc/application/search/search_bloc.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/presentaion/search/widget/title.dart';

// const imageUrl =
//     'https://static.toiimg.com/thumb/msid-83036120,imgsize-508425,width-800,height-600,resizemode-75/83036120.jpg';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  20,
                  (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(
                      imageUrl: movie.posterImageUrl,
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
