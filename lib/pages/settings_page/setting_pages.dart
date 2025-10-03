import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skypea_budget_planner/dependency_injection.dart';
import 'package:skypea_budget_planner/pages/settings_page/cubit/_cubit.dart';
part 'widgets/settings_categories.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di<CategoryCubit>()..init())],
      child: const SettingsUI(),
    );
  }
}

class SettingsUI extends StatelessWidget {
  const SettingsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [SettingsCategories()]),
    );
  }
}
