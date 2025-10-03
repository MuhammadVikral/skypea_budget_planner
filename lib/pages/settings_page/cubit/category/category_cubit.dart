import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skypea_budget_planner/data/services/database_service.dart';
import 'package:skypea_budget_planner/domain/entities/_entities.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final DatabaseService _databaseService;
  CategoryCubit(this._databaseService) : super(CategoryState.initial());

  void init() async {
    emit(CategoryState.busy());
    final categories = await _databaseService.getCategories();
    categories.fold(
      (l) {
        emit(CategoryState.failure(l));
      },
      (r) {
        emit(CategoryState.loaded(r));
      },
    );
  }
}
