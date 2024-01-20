import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:simply_english/src/config/app_theme/app_theme_provider.dart";
import "package:simply_english/src/moduls/share_dictionary/presentor/widgets/card_widget.dart";
import "package:simply_english/src/moduls/share_dictionary/presentor/widgets/input_word_field.dart";
import "package:simply_english/src/moduls/share_dictionary/presentor/widgets/select_the_rigth_word.dart";

class CardWithTheWord extends StatelessWidget {
  const CardWithTheWord({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;
    final width = MediaQuery.of(context).size.width;
    //final heigth = MediaQuery.of(context).size.height;
    const int wordLength = 12;
    const String translateForCurrentWord = 'Слово';
    bool tempValue = false;

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
        padding: EdgeInsets.symmetric(horizontal: appTheme.relativeSize.contentPadding),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0 new memorized words',
                style: appTheme.appTextStyle.body2.copyWith(color: Colors.white60),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: appTheme.relativeSize.contentPadding / 2),
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
                            borderRadius: BorderRadius.all(Radius.circular(appTheme.relativeSize.borderRadius)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 0, // (width - 32) / (wor dLength + 4),
                          height: 5,
                          decoration: BoxDecoration(
                            color: appTheme.appColors.status.success,
                            borderRadius: BorderRadius.all(Radius.circular(appTheme.relativeSize.borderRadius)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: TempWrap(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: appTheme.relativeSize.contentPadding),
                  padding: EdgeInsets.all(appTheme.relativeSize.contentPadding),
                  decoration: BoxDecoration(
                    color: appTheme.appColors.grayscale.g2,
                    borderRadius: BorderRadius.circular(appTheme.relativeSize.borderRadius),
                  ),
                  child: true ? SelectTheRigthWord() : InputWordField(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
