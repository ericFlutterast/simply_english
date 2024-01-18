import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

    return CupertinoPageScaffold(
      backgroundColor: appTheme.appColors.grayscale.g0,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CupertinoSliverNavigationBar(
              border: null,
              backgroundColor: appTheme.appColors.grayscale.g0.withOpacity(0.6),
              largeTitle: Text(
                'Home',
                style: appTheme.appTextStyle.display1,
              ),
              //brightness: Brightness.dark,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MainScreenItem(
                title: 'Тут буду выводится последние открытые словари из раздела словарный запас',
                child: _DictionaryFromVocabularity(),
              ),
              const MainScreenItem(
                title: 'Тут могут быть какие то рекомендации',
                child: _Recomendation(),
              ),
              MainScreenItem(
                title: 'Здесь какая то статистика например сначала за неделю, а потом общая сводка',
                child: SizedBox(
                  height: 300,
                  child: BarChart(
                    BarChartData(
                      maxY: 50,
                      minY: 0,
                      barGroups: [
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 30, color: Colors.pink)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 15, color: Colors.pink)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 21, color: Colors.pink)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 17, color: Colors.pink)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 10, color: Colors.pink)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 11, color: Colors.pink)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 19, color: Colors.pink)]),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreenItem extends StatefulWidget {
  final Widget child;
  final String title;

  const MainScreenItem({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  State<MainScreenItem> createState() => _MainScreenItemState();
}

class _MainScreenItemState extends State<MainScreenItem> {
  double _containerHeight = 15;
  int _maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              _maxLines = _maxLines == 1 ? 2 : 1;
              _containerHeight = _containerHeight == 15 ? 30 : 15;
            }),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _containerHeight,
              child: Text(
                widget.title,
                style: context.theme.appTextStyle.caption,
                maxLines: _maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 16),
          widget.child,
        ],
      ),
    );
  }
}

class _Recomendation extends StatelessWidget {
  const _Recomendation();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.appColors.grayscale.g3,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Column(
        children: [
          _MainPageElementItem(
            title: 'about something',
            leading: Icon(Icons.cabin, color: Colors.white),
          ),
          _MainPageElementItem(
            title: 'about something',
            leading: Icon(Icons.car_crash, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _DictionaryFromVocabularity extends StatelessWidget {
  const _DictionaryFromVocabularity();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.appColors.grayscale.g3,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          _MainPageElementItem(
              title: 'Health',
              leading: const Icon(Icons.local_hospital, color: Colors.white),
              onTap: () => context.pushNamed('card_with_the_word')),
          _MainPageElementItem(
              title: 'Nature',
              leading: const Icon(Icons.nature, color: Colors.white),
              onTap: () => context.pushNamed('/card_with_the_word')),
          _MainPageElementItem(
            title: 'Harry Potter',
            leading: const Icon(Icons.clear, color: Colors.white),
            onTap: () => context.pushNamed('/card_with_the_word'),
          ),
          _MainPageElementItem(
            title: 'things from house',
            leading: const Icon(Icons.house, color: Colors.white),
            onTap: () => context.pushNamed('/card_with_the_word'),
          )
        ],
      ),
    );
  }
}

class _MainPageElementItem extends StatelessWidget {
  final String title;
  final Widget? leading;
  final void Function()? onTap;

  const _MainPageElementItem({
    required this.title,
    this.onTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.theme.appTextStyle.body2,
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
    );
  }
}
