import 'package:flutter_riverpod_base/features/authentication/pages.dart';
import 'package:flutter_riverpod_base/router/route_name.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
