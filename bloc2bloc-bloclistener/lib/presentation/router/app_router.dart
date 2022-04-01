import 'package:flutter/material.dart';

import 'package:bloctest/presentation/screens/home_screen.dart';
import 'package:bloctest/presentation/screens/second_screen.dart';
import 'package:bloctest/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    //final GlobalKey<ScaffoldState> key = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
            //homeScreenKey: key,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
    }
  }
}
