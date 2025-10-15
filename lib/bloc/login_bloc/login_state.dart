part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

abstract class PostsActionState extends LoginState {}

final class LoginInitial extends LoginState {}

class PostLoginLoadingState extends LoginState {}

//ERROR STATE
class PostNoConnectionErrorState extends LoginState {
  final String message;
  PostNoConnectionErrorState({required this.message});
}

class PostInternetErrorState extends LoginState {}

class PostLoginSeverErrorState extends PostsActionState {}

