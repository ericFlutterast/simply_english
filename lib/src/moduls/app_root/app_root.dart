// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';

class AppRoot extends StatefulWidget {
  final Widget child;

  const AppRoot({super.key, required this.child});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentSelectedIndex = 0;
  bool _visibility = true;

  final List<(IconData icon, String lable)> _navbarItemsData = [
    (Icons.home, 'Home'),
    (Icons.book, 'Vocabularity'),
    (Icons.leaderboard, 'Statictic'),
    (Icons.person, 'Profile'),
  ];

  final _screensPath = <String>[
    '/',
    '/note',
    '/profile',
    '/statistic',
  ];

  void _getOtherTabs(String location) => context.go(location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility.maintain(
        visible: _visibility,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: context.theme.appColors.grayscale.g0,
            border: Border.all(color: context.theme.appColors.grayscale.g5),
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
                  _getOtherTabs(_screensPath[index]);
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          height: 5,
          width: isSelected ? 25 : 0,
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: appTheme.appColors.status.success,
          ),
        ),
        Stack(
          children: [
            AnimatedScale(
              scale: isSelected ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                iconData,
                color: appTheme.appColors.grayscale.g5,
              ),
            ),
            AnimatedScale(
              scale: isSelected ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                iconData,
                color: appTheme.appColors.grayscale.g6,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: appTheme.appTextStyle.caption.copyWith(
            color: isSelected ? appTheme.appColors.grayscale.g6 : appTheme.appColors.grayscale.g5,
          ),
        ),
      ],
    );
  }
}
