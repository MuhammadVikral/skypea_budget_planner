import 'package:get_it/get_it.dart';

import 'data/services/database_service.dart';
import 'pages/settings_page/cubit/category/category_cubit.dart';

final di = GetIt.asNewInstance();

class DependencyInjection {
  Future<void> injectApp() async {
    //services
    di.registerLazySingleton<DatabaseService>(() => DatabaseServiceImpl());
    //blocs
    di.registerFactory(() => CategoryCubit(di()));
  }
}
