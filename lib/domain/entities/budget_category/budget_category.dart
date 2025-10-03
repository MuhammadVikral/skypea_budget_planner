import 'package:freezed_annotation/freezed_annotation.dart';
part 'budget_category.freezed.dart';

@freezed
abstract class BudgetCategory with _$BudgetCategory {
  const factory BudgetCategory({required int id, required String name}) =
      _BudgetCategory;
}
