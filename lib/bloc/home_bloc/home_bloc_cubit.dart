// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:majootestcase/constant/constant.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/services/movie_service.dart';
part 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit() : super(HomeBlocInitialState());

  void fetching_data() async {
    emit(HomeBlocInitialState());
    emit(HomeBlocLoadingState());
    MovieService? apiServices = MovieService();
    MovieResponse? movieResponse = await apiServices.getMovieList();
    if (movieResponse == null) {
      emit(HomeBlocErrorState(ErrorText.errorConnectionText));
    } else {
      emit(HomeBlocLoadedState(movieResponse.data!));
    }
  }
}
