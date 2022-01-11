import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:majootestcase/utils/error_screen.dart';
import 'package:majootestcase/utils/loader_widget.dart';
import '../widget/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext? homeContext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocCubit, HomeBlocState>(builder: (context, state) {
      homeContext = context;
      if (state is HomeBlocLoadedState) {
        return HomeWidget(data: state.data);
      } else if (state is HomeBlocLoadingState) {
        return LoaderWidget();
      } else if (state is HomeBlocInitialState) {
        return Scaffold();
      } else if (state is HomeBlocErrorState) {
        return ErrorScreen(
          message: state.error,
          retry: retryMovie,
        );
      }

      return Center(
          child: Text(kDebugMode ? "state not implemented $state" : ""));
    });
  }

  void retryMovie() {
    homeContext!.read<HomeBlocCubit>()..fetching_data();
  }
}
