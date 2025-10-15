import 'package:flutter/material.dart';
import 'package:forever_pets/core/routes/routes.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
      case Routes.home:
        return MaterialPageRoute(builder: (_) => home());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

//TODO Will be removed when home page is created
Widget home() {
  return Scaffold();
}
