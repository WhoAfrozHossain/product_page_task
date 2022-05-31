import 'package:flutter/material.dart';
import 'package:product_page_task/features/_exports/screens_export.dart';

class Routes {
  static const String productList = "/productList";
  static const String productDetails = "/productDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.productList:
        return MaterialPageRoute(builder: (_) => ProductListPage());
      case Routes.productDetails:
        Map arguments = routeSettings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) =>
                ProductDetailsPage(slug: arguments["product_slug"]));

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
