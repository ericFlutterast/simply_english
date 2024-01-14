import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simply_english/src/moduls/app_root/app_root.dart';
import 'package:simply_english/src/moduls/main/presentor/screens/main_screen.dart';
import 'package:simply_english/src/moduls/note/presentor/screens/note_screen.dart';
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
            child: const NoteScreen(),
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
]);

Page _customTransitionPage({required BuildContext context, required GoRouterState state, required Widget child}) {
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
