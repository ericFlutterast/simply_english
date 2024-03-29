import 'package:simply_english/src/config/app_theme/theme/app_test_style/app_text_style.dart';
import 'package:simply_english/src/config/app_theme/theme/colors/app_colors.dart';
import 'package:simply_english/src/config/app_theme/theme/icons/app_icons.dart';
import 'package:simply_english/src/config/app_theme/theme/relative_size/relateve_size.dart';

interface class AppThemeImpl {
  final AppColors appColors;
  final AppIcons appIcons;
  final AppTextStyle appTextStyle;
  final RelativeSize relativeSize;

  const AppThemeImpl({
    required this.appColors,
    required this.appIcons,
    required this.appTextStyle,
    required this.relativeSize,
  });
}

class AppTheme implements AppThemeImpl {
  @override
  AppColors get appColors => AppColors(
        accent: AccentColor(),
        grayscale: GrayscaleColor(),
        status: StatusColor(),
      );

  @override
  AppIcons get appIcons => AppIcons();

  @override
  AppTextStyle get appTextStyle => AppTextStyle();

  @override
  RelativeSize get relativeSize => RelativeSize();
}
