import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:simply_english/src/config/app_theme/app_theme_provider.dart";
import "package:simply_english/src/config/app_theme/theme/theme.dart";

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
                flex: 2,
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
                      //перевод
                      _ShowTranslateTextWidget(
                        translateForCurrentWord: translateForCurrentWord,
                        appTheme: appTheme,
                        width: width,
                      )
                    ],
                  ),
                ),
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
                  child: const _SelectTheRigthWord(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputWordField extends StatelessWidget {
  const InputWordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your translate',
          style: context.theme.appTextStyle.title,
        ),
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          child: TextFormField(
            cursorColor: context.theme.appColors.grayscale.g1,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Your word...',
                hintStyle: TextStyle(color: context.theme.appColors.grayscale.g1),
                fillColor: context.theme.appColors.grayscale.g6,
                border: InputBorder.none
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(context.theme.relativeSize.borderRadius),
                // ),
                ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              context.theme.appTextStyle.body1.copyWith(color: context.theme.appColors.grayscale.g1),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.white70),
          ),
          onPressed: () {},
          child: Text(
            'Enter',
            style: context.theme.appTextStyle.body1.copyWith(
              color: context.theme.appColors.grayscale.g1,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}

class _SelectTheRigthWord extends StatelessWidget {
  const _SelectTheRigthWord();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('1');
                    },
                    child: Center(
                      child: Text(
                        'some response',
                        style: context.theme.appTextStyle.title,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: context.theme.appColors.grayscale.g5,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('2');
                    },
                    child: Center(
                      child: Text(
                        'some response',
                        style: context.theme.appTextStyle.title,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: context.theme.appColors.grayscale.g5,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('3');
                    },
                    child: Center(
                      child: Text(
                        'some response',
                        style: context.theme.appTextStyle.title,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: context.theme.appColors.grayscale.g5,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('4');
                    },
                    child: Center(
                      child: Text(
                        'some response',
                        style: context.theme.appTextStyle.title,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ShowTranslateTextWidget extends StatefulWidget {
  const _ShowTranslateTextWidget({
    required this.translateForCurrentWord,
    required this.appTheme,
    required this.width,
  });

  final String translateForCurrentWord;
  final AppTheme appTheme;
  final double width;

  @override
  State<_ShowTranslateTextWidget> createState() => _ShowTranslateTextWidgetState();
}

class _ShowTranslateTextWidgetState extends State<_ShowTranslateTextWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Expanded(
      child: Center(
        child: FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: Text(
            widget.translateForCurrentWord,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: widget.appTheme.appTextStyle.display3.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: widget.translateForCurrentWord.length < 20 ? widget.width / 10 : widget.width / 12,
            ),
          ),
        ),
      ),
    );
  }
}
