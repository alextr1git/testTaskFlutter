import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_task_flutter/core/app_router.dart';
import 'package:test_task_flutter/features/users_info/domain/models/user_model.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_cached_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/get_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/save_users_usecase.dart';
import 'package:test_task_flutter/features/users_info/domain/usecases/usecase.dart';

part 'users_bloc_event.dart';
part 'users_bloc_state.dart';

class UsersBlocBloc extends Bloc<UsersBlocEvent, UsersBlocState> {
  final SaveUsersUsecase _saveUsersUsecase;
  final GetUsersUseCase _getUsersUsecase;
  final GetCacheUsersUseCase _getCachedUsersUsecase;
  final AppRouter _router;

  UsersBlocBloc({
    required AppRouter router,
    required SaveUsersUsecase saveUsersUsecase,
    required GetUsersUseCase getUsersUsecase,
    required GetCacheUsersUseCase getCachedUsersUsecase,
  })  : _saveUsersUsecase = saveUsersUsecase,
        _getUsersUsecase = getUsersUsecase,
        _getCachedUsersUsecase = getCachedUsersUsecase,
        _router = router,
        super(
          UsersBlocLoading(),
        ) {
    on<FetchUsers>(_handleFetchUsers);
    on<UserSelected>(_handleSelectedUser);
  }

  Future<void> _handleFetchUsers(
    FetchUsers event,
    Emitter<UsersBlocState> emit,
  ) async {
    try {
      //online
      final List<UserModel> serverResponse =
          await _getUsersUsecase.execute(NoParams());
      await _saveUsersUsecase.execute(serverResponse);
      emit(UsersBlocData(serverResponse, true));
    } on DioException catch (_) {
       //offline
      final List<UserModel> cachedUsers =
          await _getCachedUsersUsecase.execute(NoParams());
      emit(UsersBlocData(cachedUsers, false));
    } catch (e) {
      emit(UsersBlocFailure(e.toString()));
    }
  }

  void _handleSelectedUser(
    UserSelected event,
    Emitter<UsersBlocState> emit,
  ) {
    try {
      _router.push(UserDetailsRoute(user: event.user));
    } catch (e) {
      emit(UsersBlocFailure(e.toString()));
    }
  }
}
