import 'package:flutter/material.dart';
import 'package:forever_pets/core/routes/routes.dart';
import 'package:forever_pets/features/boarding/presentation/pages/boarding_page.dart';
import 'package:forever_pets/features/home/presentation/pages/home_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.boarding:
        return MaterialPageRoute(builder: (_) => const BoardingPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
