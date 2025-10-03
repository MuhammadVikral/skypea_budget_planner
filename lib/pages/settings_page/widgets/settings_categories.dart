part of '../setting_pages.dart';

class SettingsCategories extends StatefulWidget {
  const SettingsCategories({super.key});

  @override
  State<SettingsCategories> createState() => _SettingsCategoriesState();
}

class _SettingsCategoriesState extends State<SettingsCategories> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Transaction Summary'),
          trailing: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        if (_expanded) const CategoriesBuilder(),
      ],
    );
  }
}

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: BlocSelector<CategoryCubit, CategoryState, CategoryState>(
        selector: (state) => state,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            busy: () => const CircularProgressIndicator(),
            failure: (error) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(width: 24),
                InkWell(
                  child: Icon(Icons.refresh),
                  onTap: () {
                    context.read<CategoryCubit>().init();
                  },
                ),
              ],
            ),
            loaded: (categories) {
              return Text(categories.name);
            },
          );
        },
      ),
    );
  }
}
