part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class PostMobileNumberValidation extends PostEvent {
  final String mobileNumber;

  PostMobileNumberValidation({required this.mobileNumber});
}

class PostEmailValidation extends PostEvent {
  final String email;

  PostEmailValidation({required this.email});
}

