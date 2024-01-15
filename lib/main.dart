import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_router.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';
import 'package:simply_english/src/config/app_theme/theme/theme.dart';

void main() {
  runApp(AppThemeProvider(
    appTheme: AppTheme(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
