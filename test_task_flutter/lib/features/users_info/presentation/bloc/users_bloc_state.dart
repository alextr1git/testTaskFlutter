part of 'users_bloc_bloc.dart';

@immutable
sealed class UsersBlocState {}

final class UsersBlocLoading extends UsersBlocState {}

final class UsersBlocFailure extends UsersBlocState {
  final String error;
  UsersBlocFailure(this.error);
}

final class UsersBlocData extends UsersBlocState {
  final List<UserModel> users;
  final bool online;
  UsersBlocData(this.users, this.online);
}
