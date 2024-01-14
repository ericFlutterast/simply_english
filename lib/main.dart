import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';
import 'package:simply_english/src/config/app_theme/theme/theme.dart';
import 'package:simply_english/src/moduls/app_root/app_root.dart';
import 'package:simply_english/src/moduls/note/presentor/screens/note_screen.dart';
import 'package:simply_english/src/moduls/profile/presentor/screens/profile_screen.dart';
import 'package:simply_english/src/moduls/statistic/presentor/screens/statistic_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        // 'home': (context) => const HomePage(),
        'note': (context) => const NoteScreen(),
        'profile': (context) => const ProfileScreen(),
        'statistic': (context) => const StatisticScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRoot();
  }
}
