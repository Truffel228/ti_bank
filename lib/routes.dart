import 'package:ti_bank/data/models/income.dart';
import 'package:ti_bank/data/models/new.dart';
import 'package:ti_bank/screens/home_page/home_page.dart';
import 'package:ti_bank/screens/add_income_screen/add_income_screen.dart';
import 'package:ti_bank/screens/income_types_screen/income_types_screen.dart';
import 'package:ti_bank/screens/incomes_screen/incomes_screen.dart';
import 'package:ti_bank/screens/initial_screen/initial_screen.dart';
import 'package:ti_bank/screens/main_screen/main_screen.dart';
import 'package:ti_bank/screens/news_detailed_screen/news_detailed_screen.dart';
import 'package:ti_bank/screens/news_screen/news_screen.dart';
import 'package:ti_bank/screens/settings_screen/settings_screen.dart';
import 'package:ti_bank/screens/ll_screen/ll_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String initial = '/initial';

  static const String main = '/main';

  static const String incomeTypes = '/incomeTypes';
  static const String incomes = '/incomes';
  static const String addIncome = '/addIncome';

  static const String news = '/news';
  static const String newsDetailed = '/newsDetailed';

  static const String settings = '/settings';

  static const String ll = '/ll';

  static GoRouter get routes => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: initial,
        routes: [
          GoRoute(
            path: initial,
            name: initial,
            builder: (context, state) => const InitialScreen(),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) => HomePage(
              child: navigationShell,
            ),
            branches: [
              StatefulShellBranch(
                initialLocation: main,
                routes: [
                  GoRoute(
                    path: main,
                    name: main,
                    builder: (context, state) => const MainScreen(),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: incomeTypes,
                routes: [
                  GoRoute(
                    path: incomeTypes,
                    name: incomeTypes,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: IncomeTypesScreen(),
                    ),
                  ),
                  GoRoute(
                    path: incomes,
                    name: incomes,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: IncomesScreen(
                        source: state.extra as IncomeSource,
                      ),
                    ),
                  ),
                  GoRoute(
                    path: addIncome,
                    name: addIncome,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: AddIncomeScreen(
                        income: (state.extra as AddIncomeScreenArgs).income,
                        source: (state.extra as AddIncomeScreenArgs).source,
                      ),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: news,
                routes: [
                  GoRoute(
                    path: news,
                    name: news,
                    builder: (context, state) => const NewsScreen(),
                  ),
                  GoRoute(
                    path: newsDetailed,
                    name: newsDetailed,
                    builder: (context, state) => NewsDetailedScreen(
                      oneNew: state.extra as New,
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: settings,
                routes: [
                  GoRoute(
                    path: settings,
                    name: settings,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ll,
            name: ll,
            builder: (context, state) =>
                LLScreen(u: state.extra as String? ?? ''),
          ),
        ],
      );
}
