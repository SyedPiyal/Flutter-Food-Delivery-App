import 'package:food_app/core/data/auth/login_repo.dart';
import 'package:food_app/core/data/auth/signup_repo.dart';
import 'package:food_app/core/data/auth/signup_repo_impl.dart';
import 'package:food_app/core/data/product/food_repo.dart';
import 'package:food_app/core/data/product/food_repo_impl.dart';
import 'package:food_app/core/network/api_client.dart';
import 'package:get_it/get_it.dart';

import '../data/auth/login_repo_impl.dart';

// Global Dependency Instance ----------------------

GetIt di = GetIt.instance;

Future<void> dependencySetup() async {
  di.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );
  di.registerLazySingleton<LoginRepository>(
    () => LoginRepoImpl(),
  );
  di.registerLazySingleton<SignUpRepository>(
    () => SignupRepoImpl(),
  );
  di.registerLazySingleton<FoodRepository>(
    () => FoodRepoImpl(),
  );
}
