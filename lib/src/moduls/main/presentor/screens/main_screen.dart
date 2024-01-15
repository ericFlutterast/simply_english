import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simply_english/src/config/app_theme/app_theme_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme;

    // return CupertinoPageScaffold(
    //   backgroundColor: appTheme.appColors.grayscale.g0,
    //   child: NestedScrollView(
    //     headerSliverBuilder: (context, innerBoxIsScrolled) {
    //       return [
    //         CupertinoSliverNavigationBar(
    //           backgroundColor: appTheme.appColors.grayscale.g0.withOpacity(0.4),
    //           border: null,
    //           largeTitle: Text(
    //             'Home',
    //             style: appTheme.appTextStyle.display1,
    //           ),
    //           //brightness: Brightness.dark,
    //         ),
    //       ];
    //     },
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           ...List.generate(
    //             5,
    //             (index) {
    //               return Container(
    //                 height: MediaQuery.of(context).size.height / 4,
    //                 margin: const EdgeInsets.all(16),
    //                 decoration: BoxDecoration(
    //                   color: appTheme.appColors.grayscale.g4,
    //                   borderRadius: BorderRadius.circular(30),
    //                 ),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: appTheme.appColors.grayscale.g0,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          ...List.generate(
            5,
            (index) {
              return Container(
                height: MediaQuery.of(context).size.height / 4,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: appTheme.appColors.grayscale.g4,
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  static const double _appBarHeight = 50;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(CustomAppBar._appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter - widget.preferredSize.height > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore - widget.preferredSize.height > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarContent = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _scrolledUnder
              ? Text('Home',
                  style: context.theme.appTextStyle.display1.copyWith(
                    fontWeight: FontWeight.w800,
                  ))
              : null,
        ),
      ],
    );

    if (_scrolledUnder) {
      appBarContent = Container(
        color: context.theme.appColors.grayscale.g3.withOpacity(0.3),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: appBarContent,
          ),
        ),
      );
    }

    return appBarContent;
  }
}
