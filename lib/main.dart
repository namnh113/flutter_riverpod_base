import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/constant/theme.dart';
import 'package:flutter_riverpod_base/router/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: lightTheme,
      ),
    );
  }
}
