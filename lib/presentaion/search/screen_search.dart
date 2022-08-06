import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_bloc/application/search/search_bloc.dart';
import 'package:netflix_bloc/core/constants.dart';
import 'package:netflix_bloc/domain/debounce/debounce.dart';
import 'package:netflix_bloc/presentaion/search/widget/search_idle.dart';
import 'package:netflix_bloc/presentaion/search/widget/search_result_page.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              _debouncer.run(() {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));
              });
            },
          ),
          kHeight,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const SearchIdleWIdjet();
              } else {
                return const SearchResultPage();
              }
            },
          )),
          // const Expanded(child: SearchResultPage ()),
        ],
      ),
    )));
  }
}
