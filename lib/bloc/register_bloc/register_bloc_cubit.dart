// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/helper/db_helper.dart';
import 'package:majootestcase/models/user.dart';

part 'register_bloc_state.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  RegisterBlocCubit() : super(RegisterBlocInitialState());
  DBHelper _dbHelper = DBHelper();

  void register_user(User? user, String successText) async {
    emit(RegisterBlocInitialState());
    emit(RegisterBlocLoadingState());
    if (user == null) {
      emit(RegisterBlocLoadingState());
    } else {
      emit(RegisterBlocLoadingState());
      _dbHelper.insertUser(user);
      emit(RegisterBlocSuccesState(successText));
    }
  }

  void register_failed(String errorText) async {
    emit(RegisterBlocLoadingState());
    emit(RegisterBlocErrorState(errorText));
  }
}
