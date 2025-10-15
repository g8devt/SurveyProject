
import 'package:flutter_bloc/flutter_bloc.dart';

class NavDrawerCubit extends Cubit<int> {
  NavDrawerCubit() : super(0);

  void emitSetValue(int state) => emit(state);
}