// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentSelectedIndex = 0;
  final List<(IconData icon, String lable)> _navbarItemsData = [
    (Icons.home, 'home'),
    (Icons.book, 'note'),
    (Icons.leaderboard, 'statictic'),
    (Icons.person, 'profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: context.theme.appColors.grayscale.g0,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: context.theme.appColors.grayscale.g0,
                offset: const Offset(0, 20),
                blurRadius: 40,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _navbarItemsData.length,
              (index) => GestureDetector(
                onTap: () => setState(() {
                  _currentSelectedIndex = index;
                }),
                child: _NavbarItemWidget(
                  iconData: _navbarItemsData[index].$1,
                  label: _navbarItemsData[index].$2,
                  isSelected: _currentSelectedIndex == index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavbarItemWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData iconData;

  const _NavbarItemWidget({
    required this.isSelected,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: isSelected ? appTheme.appColors.grayscale.g6 : appTheme.appColors.grayscale.g5,
          ),
          Text(
            label,
            style: appTheme.appTextStyle.caption.copyWith(
              color: isSelected ? appTheme.appColors.grayscale.g6 : appTheme.appColors.grayscale.g5,
            ),
          ),
        ],
      ),
    );
  }
}
