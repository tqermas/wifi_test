import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wifi_list/presentation/screens/wifi_search/wifi_search_screen.dart';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: GlobalKey<NavigatorState>(),
      initialLocation: AppRoutes.wifiSearch.path,
      routes: [
        GoRoute(
          path: AppRoutes.wifiSearch.path,
          name: AppRoutes.wifiSearch.name,
          builder: (context, state) => const WifiSearchScreen(),
        )
  ]
  );

}

enum AppRoutes {
  wifiSearch('/wifi_search', 'wifi_search');

  final String path;
  final String name;

  const AppRoutes(this.path, this.name);
}