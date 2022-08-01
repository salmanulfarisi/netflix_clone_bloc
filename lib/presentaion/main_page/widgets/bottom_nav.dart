import 'package:flutter/material.dart';
import 'package:netflix_bloc/core/colors/colors.dart';

ValueNotifier<int> indexChange = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChange,
        builder: (context, int newValue, _) {
          return BottomNavigationBar(
            currentIndex: newValue,
            onTap: (index) {
              indexChange.value = index;
            },
            elevation: 0,
            backgroundColor: backGroungColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New&Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Download'),
            ],
          );
        });
    // return BottomNavigationBar(
    //   currentIndex: 0,
    //   elevation: 0,
    //   backgroundColor: backGroungColor,
    //   type: BottomNavigationBarType.fixed,
    //   selectedItemColor: Colors.white,
    //   unselectedItemColor: Colors.grey,
    //   selectedIconTheme: const IconThemeData(color: Colors.white),
    //   unselectedIconTheme: const IconThemeData(color: Colors.grey),
    //   items: const [
    //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.collections), label: 'New&Hot'),
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.emoji_emotions), label: 'Fast Laugh'),
    //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    //     BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Download'),
    //   ],
    // );
  }
}
