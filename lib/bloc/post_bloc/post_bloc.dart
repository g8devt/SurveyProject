import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(LoginInitial()) {
    on<PostMobileNumberValidation>(postMobileNumberValidEvent);
  }

  FutureOr<void> postMobileNumberValidEvent(PostMobileNumberValidation event, Emitter<PostState> emit) async {
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