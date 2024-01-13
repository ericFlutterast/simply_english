import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';

class AppRouterWidget extends StatelessWidget {
  const AppRouterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: context.theme.appColors.status.error,
        ),
      ),
    );
  }
}
