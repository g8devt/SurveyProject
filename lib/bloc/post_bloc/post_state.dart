part of 'post_bloc.dart';

@immutable
sealed class PostState {}

abstract class PostsActionState extends PostState {}

final class LoginInitial extends PostState {}

class PostLoginLoadingState extends PostState {}

//ERROR STATE
class PostNoConnectionErrorState extends PostState {
  final String message;
  PostNoConnectionErrorState({required this.message});
}

class PostInternetErrorState extends PostState {}

class PostLoginSeverErrorState extends PostsActionState {}

