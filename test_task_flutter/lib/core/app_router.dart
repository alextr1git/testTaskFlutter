import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/presentation/views/home.dart';
import 'package:test_task_flutter/features/users_info/presentation/views/user_details_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeRoute.page, initial: true),
        AutoRoute(path: '/user-details', page: UserDetailsRoute.page),
      ];
}
