import 'package:dartz/dartz.dart';
import 'package:skypea_budget_planner/domain/entities/budget_category/budget_category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logger/logger.dart';

abstract interface class DatabaseService {
  Future<Either<Exception, BudgetCategory>> getCategories();
}

class DatabaseServiceImpl implements DatabaseService {
  @override
  Future<Either<Exception, BudgetCategory>> getCategories() async {
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase.from('instruments').select();
      Logger().d(data);
      return Left(Exception('succes'));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
