import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';
import 'package:simply_english/src/config/app_theme/theme/theme.dart';
import 'package:simply_english/src/moduls/share_dictionary/domain/dictionary_model.dart';
import 'package:simply_english/src/moduls/share_dictionary/presentor/screens/card_with_the_word.dart';

enum AnswerStatus { correctAnswer, wrongAnswer }

class CardWidget extends StatefulWidget {
  final String word, translatingWord;
  final bool isFront;

  const CardWidget({
    super.key,
    required this.word,
    required this.isFront,
    required this.translatingWord,
  });

  @override
  State<CardWidget> createState() => _CardWithWordState();
}

class _CardWithWordState extends State<CardWidget> {
  bool _isDragging = false;
  double _angle = 0;
  Size _screenSize = Size.zero;
  Offset _position = Offset.zero;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      _screenSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isFront ? buildFrontCard() : buildCard();
  }

  void _eventHandlerOnPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
    });
  }

  void _eventHandlerOnPanUpdate(DragUpdateDetails details) {
    final x = _position.dx;
    setState(() {
      _angle = 45 * x / _screenSize.width;
      _position += details.delta;
    });
  }

  void _eventHandlerOnPanEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });

    final status = _getStatus();
    switch (status) {
      case AnswerStatus.correctAnswer:
        _processingAnswer(status!);
        break;
      case AnswerStatus.wrongAnswer:
        _processingAnswer(status!);
        break;

      default:
        _endPosition();
    }
  }

  void _endPosition() => setState(() {
        _angle = 0;
        _isDragging = false;
        _position = Offset.zero;
      });

  AnswerStatus? _getStatus() {
    final x = _position.dx;

    final status = switch (x) {
      >= 100 => AnswerStatus.correctAnswer,
      <= -100 => AnswerStatus.wrongAnswer,
      _ => null,
    };

    return status;
  }

  void _processingAnswer(AnswerStatus status) {
    final contantDxOffset = status == AnswerStatus.correctAnswer ? 2 : -2;

    setState(() {
      _angle = status == AnswerStatus.correctAnswer ? 20 : -20;
      _position += Offset(contantDxOffset * _screenSize.width, 0);
      _nextCard();
    });
  }

  Future _nextCard() async {
    if (DictionaryModel.constDictionary.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      DictionaryModel.constDictionary.remove(widget.word);
      final state = context.findAncestorStateOfType<CardWithTheWordState>();
      setState(() {
        state!.setState(() {});
      });
    });
  }

  Widget buildFrontCard() {
    int milliseconds = _isDragging ? 0 : 400;
    final angle = _angle * pi / 180;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final center = constraints.smallest.center(Offset.zero);

        final rotateMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return GestureDetector(
          onPanStart: (details) => _eventHandlerOnPanStart(details),
          onPanUpdate: (details) => _eventHandlerOnPanUpdate(details),
          onPanEnd: (details) => _eventHandlerOnPanEnd(details),
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: milliseconds),
            transform: rotateMatrix..translate(_position.dx, _position.dy),
            child: buildCard(),
          ),
        );
      },
    );
  }

  Widget buildCard() {
    return _CardWord(
      title: widget.word,
      translatingWord: widget.translatingWord,
    );
  }
}

class _CardWord extends StatelessWidget {
  final String title, translatingWord;

  const _CardWord({
    required this.title,
    required this.translatingWord,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;

    return Container(
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
                  color: true ? appTheme.appColors.grayscale.g4 : appTheme.appColors.status.success,
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
                      title,
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
            translateForCurrentWord: translatingWord,
            appTheme: appTheme,
            width: MediaQuery.of(context).size.width,
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
    //_animationController.forward();

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
