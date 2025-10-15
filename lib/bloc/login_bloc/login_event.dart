part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class PostMobileNumberValidation extends LoginEvent {
  final String mobileNumber;

  PostMobileNumberValidation({required this.mobileNumber});
}

class PostEmailValidation extends LoginEvent {
  final String email;

  PostEmailValidation({required this.email});
}

