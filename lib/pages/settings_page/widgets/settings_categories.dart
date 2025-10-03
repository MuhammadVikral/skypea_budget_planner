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
          splashColor: Theme.of(context).splashColor,
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
              return Column(
                spacing: 12,
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {},
                    color: Theme.of(context).splashColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Text('Add New Category'),
                          Icon(Icons.add, size: 24),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        ListTile(title: Text(categories[index].name)),
                    itemCount: categories.length,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
