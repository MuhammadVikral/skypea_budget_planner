import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:skypea_budget_planner/pages/_pages.dart';
import 'package:skypea_budget_planner/routing/main_fab.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/budget',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          floatingActionButton: MainFab(),
          floatingActionButtonLocation: ExpandableFab.location,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Transactions',
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart),
                label: 'Budget',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: DashboardPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/transactions',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TransactionsPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/budget',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: BudgetPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingPage()),
            ),
          ],
        ),
      ],
    ),
  ],
);
