import "package:flutter/material.dart";
import "package:simply_english/src/config/app_theme/app_theme_provider.dart";

class SelectTheRigthWord extends StatelessWidget {
  const SelectTheRigthWord({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(context.theme.relativeSize.contentPadding),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            const _RowItem(ansverOptions: ['Лес', 'Мир']),
            Divider(
              height: 1,
              color: context.theme.appColors.grayscale.g5,
            ),
            const _RowItem(ansverOptions: ['Санки', 'Слово']),
          ],
        ),
      ),
    );
  }
}

class _ButtonItem extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const _ButtonItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap;
        },
        child: Center(
          child: Text(
            title,
            style: context.theme.appTextStyle.title,
          ),
        ),
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final List<String> ansverOptions;

  const _RowItem({required this.ansverOptions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          _ButtonItem(
            title: ansverOptions.first,
            onTap: () {},
          ),
          Container(
            width: 1,
            color: context.theme.appColors.grayscale.g5,
          ),
          _ButtonItem(
            title: ansverOptions.last,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
