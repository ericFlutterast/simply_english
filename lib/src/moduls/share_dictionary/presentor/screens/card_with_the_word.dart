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
                          width: 0, // (width - 32) / (wordLength + 4),
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
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(appTheme.relativeSize.contentPadding),
                  decoration: BoxDecoration(
                    color: appTheme.appColors.grayscale.g2,
                    borderRadius: BorderRadius.circular(appTheme.relativeSize.borderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: tempValue ? appTheme.appColors.grayscale.g4 : appTheme.appColors.status.success,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(width: appTheme.relativeSize.contentPadding),
                          Expanded(
                            child: Text(
                              'New word',
                              style: appTheme.appTextStyle.body2.copyWith(color: Colors.white60),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Colors.white,
                              ),
                            ),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: appTheme.relativeSize.contentPadding,
                          top: appTheme.relativeSize.contentPadding * 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name of dictionary',
                                  overflow: TextOverflow.ellipsis,
                                  style: appTheme.appTextStyle.body2.copyWith(color: Colors.white60),
                                ),
                                Text(
                                  'Word',
                                  style: appTheme.appTextStyle.display2.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '[Transcription]',
                                  maxLines: 2,
                                  style: appTheme.appTextStyle.display1,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: appTheme.relativeSize.contentPadding / 2),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: appTheme.relativeSize.contentPadding),
                  decoration: BoxDecoration(
                    color: appTheme.appColors.grayscale.g2,
                    borderRadius: BorderRadius.circular(appTheme.relativeSize.borderRadius),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'here will be response',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
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
