import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/theme/theme.dart';

class AppThemeProvider extends InheritedWidget {
  final AppTheme appTheme;

  const AppThemeProvider({
    super.key,
    required this.appTheme,
    required super.child,
  });

  static AppThemeProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
  }

  static AppThemeProvider of(BuildContext context) {
    final AppThemeProvider? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) => oldWidget.appTheme != appTheme;
}

extension CoreUtils on BuildContext {
  AppTheme get theme => AppThemeProvider.of(this).appTheme;
}
