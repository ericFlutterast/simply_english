import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:simply_english/src/config/app_theme/app_theme_provider.dart";
import "package:simply_english/src/config/app_theme/theme/theme.dart";
import "package:simply_english/src/moduls/share_dictionary/domain/dictionary_model.dart";

import "package:simply_english/src/moduls/share_dictionary/presentor/widgets/card_widget.dart";
import "package:simply_english/src/moduls/share_dictionary/presentor/widgets/input_word_field.dart";
import "package:simply_english/src/moduls/share_dictionary/presentor/widgets/select_the_rigth_word.dart";

class CardWithTheWord extends StatefulWidget {
  const CardWithTheWord({super.key});

  @override
  State<CardWithTheWord> createState() => CardWithTheWordState();
}

class CardWithTheWordState extends State<CardWithTheWord> {
  List<Widget> _remapingDictionary() {
    return DictionaryModel.constDictionary.keys.map((key) {
      return CardWidget(
        isFront: DictionaryModel.constDictionary.keys.last == key,
        word: key,
        translatingWord: DictionaryModel.constDictionary[key] ?? '',
      );
    }).toList();
  }

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
                    DictionaryModel.dictionaryLength,
                    (index) {
                      final itemWeigth =
                          (MediaQuery.of(context).size.width - 32) / (DictionaryModel.dictionaryLength + 4);
                      final amoutOfSelectItem =
                          DictionaryModel.dictionaryLength - DictionaryModel.constDictionary.length;
                      if (index < amoutOfSelectItem) {
                        return IndicatorItem(
                          itemWeigth: itemWeigth,
                          isSelect: true,
                        );
                      }

                      return IndicatorItem(
                        itemWeigth: itemWeigth,
                        isSelect: false,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(children: _remapingDictionary()),
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
                  child: false ? SelectTheRigthWord() : InputWordField(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorItem extends StatefulWidget {
  const IndicatorItem({
    super.key,
    required this.isSelect,
    required this.itemWeigth,
  });

  final double itemWeigth;
  final bool isSelect;

  @override
  State<IndicatorItem> createState() => _IndicatorItemState();
}

class _IndicatorItemState extends State<IndicatorItem> {
  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = context.theme;

    return Stack(
      children: [
        Container(
          width: widget.itemWeigth,
          height: 5,
          decoration: BoxDecoration(
            color: appTheme.appColors.grayscale.g4,
            borderRadius: BorderRadius.all(Radius.circular(appTheme.relativeSize.borderRadius)),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: widget.isSelect ? widget.itemWeigth : 0,
          height: 5,
          decoration: BoxDecoration(
            color: appTheme.appColors.status.success,
            borderRadius: BorderRadius.all(Radius.circular(appTheme.relativeSize.borderRadius)),
          ),
        ),
      ],
    );
  }
}
