import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<PostMobileNumberValidation>(postMobileNumberValidEvent);
  }

  FutureOr<void> postMobileNumberValidEvent(PostMobileNumberValidation event, Emitter<LoginState> emit) async {
    emit(PostLoginLoadingState());
    // bool internet = await check();
    // if (internet) {
    //   APIResult success = await PostsRepo.loginValidMobileNumberPost(mobileNumber: event.mobileNumber);
    //   printDebug(success.toString(), title: 'PostMobileNumberValidation');
    //   if (success.status) {
    //     emit(PostMobileNumberValidSuccessfulState(apiResult: success));
    //   } else {
    //     emit(PostMobileNumberValidErrorState(apiResult: success));
    //   }
    // } else {
    //   emit(PostNoConnectionErrorState(message: Common.noInternet));
    // }
  }
}