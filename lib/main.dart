import 'package:flutter/material.dart';
import 'package:skypea_budget_planner/app_theme.dart';
import 'package:skypea_budget_planner/dependency_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'routing/main_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  await Supabase.initialize(
    url: 'https://bkppbccrmrhjirroseod.supabase.co',
    anonKey: supabaseKey,
  );
  await DependencyInjection().injectApp();
  await di.allReady();
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
