import 'package:flutter/material.dart';
import 'package:product_page_task/features/product/screens/product_list.dart';

class Routes {
  static const String home = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => ProductListPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No route found"),
        ),
        body: const Center(
          child: Text(
            "No route found",
          ),
        ),
      ),
    );
  }
}
