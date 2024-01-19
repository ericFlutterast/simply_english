import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';

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
