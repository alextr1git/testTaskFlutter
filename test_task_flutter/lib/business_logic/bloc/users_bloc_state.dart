part of 'users_bloc_bloc.dart';

@immutable
sealed class UsersBlocState {}

final class UsersBlocInitial extends UsersBlocState {}

final class UsersBlocLoading extends UsersBlocState {}

final class UsersBlocFailure extends UsersBlocState {
  final String error;
  UsersBlocFailure(this.error);
}

final class UsersBlocLoaded extends UsersBlocState {
  final List<UserModel> users;
  UsersBlocLoaded(this.users);
}
