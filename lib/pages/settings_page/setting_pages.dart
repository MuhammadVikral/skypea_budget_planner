import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skypea_budget_planner/dependency_injection.dart';
import 'package:skypea_budget_planner/pages/settings_page/cubit/_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
      child: Column(
        spacing: 24,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(Icons.logout),
              onTap: () async {
                await supabase.auth.signInWithPassword(
                  password: '123',
                  email: 'mvikral100@gmail.com',
                );
              },
            ),
          ),
          SettingsCategories(),
        ],
      ),
    );
  }
}
