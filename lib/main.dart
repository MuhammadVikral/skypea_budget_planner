import 'package:flutter/material.dart';
import 'package:skypea_budget_planner/app_theme.dart';

import 'routing/main_router.dart';

void main() {
  runApp(const BudgetPlannerApp());
}

class BudgetPlannerApp extends StatelessWidget {
  const BudgetPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.darkTheme,
    );
  }
}
