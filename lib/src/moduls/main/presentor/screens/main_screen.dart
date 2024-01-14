import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;

    return Scaffold(
      backgroundColor: appTheme.appColors.grayscale.g0,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appTheme.appColors.grayscale.g1,
            flexibleSpace: Center(
              child: Text(
                'Home page',
                style: appTheme.appTextStyle.display1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
