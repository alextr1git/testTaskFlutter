import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_flutter/data/models/user_model.dart';
import 'package:test_task_flutter/data/repositories/users_repository.dart';

part 'users_bloc_event.dart';
part 'users_bloc_state.dart';

class UsersBlocBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final UsersRepository _usersRepository;

  UsersBlocBloc(this._usersRepository) : super(UsersBlocInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UsersBlocLoading());
      try {
        final users = await _usersRepository.getUsers();
        emit(UsersBlocLoaded(users));
      } catch (e) {
        emit(UsersBlocFailure(e.toString()));
      }
    });
  }
}
