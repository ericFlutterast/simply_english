import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:simply_english/src/moduls/app_root/app_root.dart';
import 'package:simply_english/src/moduls/main/presentor/screens/main_screen.dart';
import 'package:simply_english/src/moduls/share_dictionary/presentor/screens/card_with_the_word.dart';
import 'package:simply_english/src/moduls/vocabularity/presentor/screens/vocabularity_screen.dart';
import 'package:simply_english/src/moduls/profile/presentor/screens/profile_screen.dart';
import 'package:simply_english/src/moduls/statistic/presentor/screens/statistic_screen.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(routes: [
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) {
      return AppRoot(child: child);
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'main',
        pageBuilder: (context, state) {
          return _customTransitionPage(
            context: context,
            state: state,
            child: const MainScreen(),
          );
        },
      ),
      GoRoute(
        path: '/note',
        name: 'note',
        pageBuilder: (context, state) {
          return _customTransitionPage(
            context: context,
            state: state,
            child: const VocabularityScreen(),
          );
        },
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) {
          return _customTransitionPage(
            context: context,
            state: state,
            child: const ProfileScreen(),
          );
        },
      ),
      GoRoute(
        path: '/statistic',
        name: 'statistic',
        pageBuilder: (context, state) {
          return _customTransitionPage(
            context: context,
            state: state,
            child: const StatisticScreen(),
          );
        },
      ),
    ],
  ),
  GoRoute(
      path: '/card_with_the_word',
      name: 'card_with_the_word',
      pageBuilder: (context, state) {
        return _customTransitionPage(
          context: context,
          state: state,
          child: const CardWithTheWord(),
        );
      })
]);

Page _customTransitionPage({required BuildContext context, required GoRouterState state, required Widget child}) {
  if (child is CardWithTheWord) {
    return CupertinoPage(
      key: state.pageKey,
      child: child,
    );
  }

  return CustomTransitionPage(
    child: child,
    key: state.pageKey,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        key: state.pageKey,
        opacity: CurveTween(curve: Curves.easeInCubic).animate(animation),
        child: child,
      );
    },
  );
}
