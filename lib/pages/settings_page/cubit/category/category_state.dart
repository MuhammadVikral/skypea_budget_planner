part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.busy() = _Busy;
  const factory CategoryState.failure(Exception failure) = _Failure;
  const factory CategoryState.loaded(List<BudgetCategory> categories) = _Loaded;
}
