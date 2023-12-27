import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task_flutter/core/app_router.dart';
import 'package:test_task_flutter/features/users_info/data/providers/api/api_service.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive/hive_provider.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive/hive_provider_impl.dart';
import 'package:test_task_flutter/features/users_info/data/providers/hive_initialiser.dart';
import 'package:test_task_flutter/features/users_info/data/repositories/users_repository_impl.dart';
import 'package:test_task_flutter/features/users_info/domain/repositories/users_repository.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_cached_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/save_users_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();
  final usersBox = await initialiseHive();
  final dio = Dio(BaseOptions(contentType: "application/json"));

  locator.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  locator.registerLazySingleton<HiveProvider>(
    () => HiveProviderImpl(usersBox: usersBox),
  );

  locator.registerLazySingleton<ApiService>(() => ApiService(dio));

  locator.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(
        hiveProvider: locator<HiveProvider>(),
        apiProvider: locator<ApiService>(),
      ));

  locator.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(repository: locator<UsersRepository>()),
  );

  locator.registerLazySingleton<GetCacheUsersUseCase>(
    () => GetCacheUsersUseCase(repository: locator<UsersRepository>()),
  );

  locator.registerLazySingleton<SaveUsersUsecase>(
    () => SaveUsersUsecase(repository: locator<UsersRepository>()),
  );
}
