import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:simply_english/src/config/app_theme/app_theme_provider.dart";

class CardWithTheWord extends StatelessWidget {
  const CardWithTheWord({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;

    return Scaffold(
        backgroundColor: appTheme.appColors.grayscale.g0,
        appBar: AppBar(
          backgroundColor: appTheme.appColors.grayscale.g0,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            'Your dictionary',
            style: appTheme.appTextStyle.display1.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [],
        ));
  }
}
