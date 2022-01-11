import 'package:majootestcase/helper/db_helper.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/ui/home/page/home_page.dart';
import 'package:majootestcase/ui/login/page/login_page.dart';
import 'package:majootestcase/utils/loader_widget.dart';
import 'package:majootestcase/utils/shared_preferences.dart';
import 'bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc/home_bloc_cubit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => AuthBlocCubit()..fetch_history_login(),
        child: MyHomePageScreen(),
      ),
    );
  }
}

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  DBHelper _dbHelper = DBHelper();
  bool? statusCreateUser;
  @override
  void initState() {
    initialLocalDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBlocCubit, AuthBlocState>(builder: (c, state) {
      if (state is AuthBlocLoadingState) {
        return LoaderWidget();
      }

      if (state is AuthBlocLoginState) {
        return BlocProvider(
          create: (context) => AuthBlocCubit()..fetch_history_login(),
          child: LoginPage(),
        );
      }

      if (state is AuthBlocLoggedInState) {
        return BlocProvider(
          create: (context) => HomeBlocCubit()..fetching_data(),
          child: HomePage(),
        );
      }

      return LoaderWidget();
    });
  }

  void initialLocalDb() async {
    statusCreateUser = await SharedPrefsStorage.getStatusCreateUser();
    if (statusCreateUser == null || statusCreateUser == false) {
      _dbHelper.initializeDatabase().then((value) => insertUser());
    }
  }

  void insertUser() {
    User _userInput = User(
      email: 'majoo@gmail.com',
      userName: 'majoo',
      password: '123456',
    );

    _dbHelper.insertUser(_userInput);
    SharedPrefsStorage.setStatusCreateUser(true);
  }
}
