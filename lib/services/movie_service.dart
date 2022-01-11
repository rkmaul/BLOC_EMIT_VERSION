import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/config/dio_config.dart' as dioConfig;

class MovieService {
  Future<MovieResponse?> getMovieList() async {
    try {
      var dio = await dioConfig.dio();
      Response<String>? response = await dio.get("");
      if (response.statusCode == 200) {
        MovieResponse? movieResponse =
            MovieResponse.fromJson(jsonDecode(response.data!));
        return movieResponse;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        // print('TIME OUTT');
        print(e.toString());
      }
      return null;
    }
  }
}
