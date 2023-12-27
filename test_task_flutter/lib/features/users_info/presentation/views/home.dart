import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_flutter/core/app_router.dart';
import 'package:test_task_flutter/core/dependencies.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_cached_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/save_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/presentation/bloc/users_bloc_bloc.dart';
import 'package:test_task_flutter/features/users_info/presentation/widgets/users_list_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBlocBloc(
        router: locator<AppRouter>(),
        saveUsersUsecase: locator<SaveUsersUsecase>(),
        getUsersUsecase: locator<GetUsersUseCase>(),
        getCachedUsersUsecase: locator<GetCacheUsersUseCase>(),
      )..add(FetchUsers()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Test Task"),
          ),
          body: BlocBuilder<UsersBlocBloc, UsersBlocState>(
            builder: (context, state) {
              if (state is UsersBlocLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UsersBlocData) {
                List<UserModel> usersList = state.users;
                if (state.online) {
                  return UsersListView(
                      users: usersList,
                      onTap: (user) {
                        BlocProvider.of<UsersBlocBloc>(context).add(
                          UserSelected(user: user),
                        );
                      });
                } else {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(width: 5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "You are offline",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: UsersListView(
                            users: usersList,
                            onTap: (user) {
                              BlocProvider.of<UsersBlocBloc>(context).add(
                                UserSelected(user: user),
                              );
                            }),
                      ),
                    ],
                  );
                }
              } else if (state is UsersBlocFailure) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Container();
            },
          )),
    );
  }
}
