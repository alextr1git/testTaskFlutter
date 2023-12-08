import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_flutter/business_logic/bloc/users_bloc_bloc.dart';
import 'package:test_task_flutter/constants/routes.dart';
import 'package:test_task_flutter/data/models/user_model.dart';
import 'package:test_task_flutter/data/repositories/users_repository.dart';
import 'package:test_task_flutter/presentation/views/users_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBlocBloc(
        RepositoryProvider.of<UsersRepository>(context),
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
              } else if (state is UsersBlocLoaded) {
                List<UserModel> usersList = state.users;
                return UsersListView(
                    users: usersList,
                    onTap: (user) {
                      Navigator.of(context)
                          .pushNamed(userDetailsRoute, arguments: user);
                    });
              } else if (state is UsersBlocFailure) {
                return Center(
                  child: Text("Something went wrong."),
                );
              } else if (state is UsersBlocOffline) {
                return Center(
                  child: Text("No connection!"),
                );
              }
              return Container();
            },
          )),
    );
  }
}
