import 'package:flutter/material.dart';
import 'package:skypea_budget_planner/app_theme.dart';
import 'package:skypea_budget_planner/dependency_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'routing/main_router.dart';

void main() async {
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  await Supabase.initialize(
    url: 'https://bkppbccrmrhjirroseod.supabase.co',
    anonKey: supabaseKey,
    headers: {
      'apikey':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrcHBiY2NybXJoamlycm9zZW9kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk0NjI3MTksImV4cCI6MjA3NTAzODcxOX0.z6bk5sCm9GI8RFoDRa0jhuVjkew5K2cfUBNjAsAG4e4',
    },
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
