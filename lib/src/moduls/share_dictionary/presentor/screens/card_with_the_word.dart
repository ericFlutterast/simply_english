import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:simply_english/src/config/app_theme/app_theme_provider.dart";

class CardWithTheWord extends StatelessWidget {
  const CardWithTheWord({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    const int wordLength = 12;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0 new memorized words',
                style: appTheme.appTextStyle.body2.copyWith(color: Colors.white60),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    wordLength,
                    (index) => Stack(
                      children: [
                        Container(
                          width: (width - 32) / (wordLength + 4),
                          height: 5,
                          decoration: BoxDecoration(
                            color: appTheme.appColors.grayscale.g4,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 0, // (width - 32) / (wordLength + 4),
                          height: 5,
                          decoration: BoxDecoration(
                            color: appTheme.appColors.status.success,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: appTheme.appColors.grayscale.g3,
                    borderRadius: BorderRadius.circular(appTheme.relativeSize.borderRadius),
                  ),
                ),
              ),
              SizedBox(height: appTheme.relativeSize.contentPadding),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: appTheme.appColors.grayscale.g5,
                    borderRadius: BorderRadius.circular(appTheme.relativeSize.borderRadius),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
