import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_bloc/application/downloads/downloads_bloc.dart';
import 'package:netflix_bloc/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_bloc/application/home/home_bloc.dart';
import 'package:netflix_bloc/application/hot_and_new/hot_andnew_bloc.dart';
import 'package:netflix_bloc/application/search/search_bloc.dart';
import 'package:netflix_bloc/core/colors/colors.dart';
import 'package:netflix_bloc/domain/core/di/injectable.dart';
import 'package:netflix_bloc/presentaion/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  // await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DownloadsBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<FastLaughBloc>()),
        BlocProvider(create: (context) => getIt<HotAndnewBloc>()),
        BlocProvider(create: (context) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: backGroungColor,
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            )),
        home: ScreenMainPage(),
      ),
    );
  }
}
