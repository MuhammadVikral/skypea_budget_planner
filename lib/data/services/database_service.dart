import 'package:dartz/dartz.dart';
import 'package:skypea_budget_planner/dependency_injection.dart';
import 'package:skypea_budget_planner/domain/entities/budget_category/budget_category.dart';
import 'package:logger/logger.dart';

abstract interface class DatabaseService {
  Future<Either<Exception, List<BudgetCategory>>> getCategories();
}

class DatabaseServiceImpl implements DatabaseService {
  @override
  Future<Either<Exception, List<BudgetCategory>>> getCategories() async {
    try {
      final data = await supabase.from('category').select('id,name');
      Logger().d(data);
      return Right([BudgetCategory(id: data[0]['id'], name: data[0]['name'])]);
      return Left(Exception('succes'));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
