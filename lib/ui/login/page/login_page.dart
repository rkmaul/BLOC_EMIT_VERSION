// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/auth_bloc/auth_bloc_cubit.dart';
import 'package:majootestcase/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:majootestcase/common/widget/custom_button.dart';
import 'package:majootestcase/common/widget/text_form_field.dart' as txt;
import 'package:majootestcase/constant/constant.dart';
import 'package:majootestcase/helper/db_helper.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/ui/home/page/home_page.dart';
import 'package:majootestcase/ui/login/widget/register_widget.dart';
import 'package:majootestcase/utils/dynamic_space.dart';
import 'package:majootestcase/utils/flushbar_widget.dart';
import 'package:majootestcase/utils/text_form_field_widget.dart';
import 'package:majootestcase/utils/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  BuildContext? authContext;

  DBHelper _dbHelper = DBHelper();

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final _emailController = txt.TextController('');
  final _passwordController = txt.TextController('');
  final _usernameController = txt.TextController('');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBlocCubit, AuthBlocState>(
      listener: (c, state) {
        authContext = c;
        if (state is AuthBlocErrorState) {
          FlushBar.flushBarView(context: c, message: state.error);
        }
        if (state is AuthBlocLoggedInState) {
          FocusScope.of(context).requestFocus(new FocusNode());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => HomeBlocCubit()..fetching_data(),
                child: HomePage(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 75, left: 25, bottom: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(PageText.welcomeText, style: normalFont24Bold),
                Text(PageText.pleaseLoginFirst, style: normalFont15w400),
                DynamicSpace.verticalSpace9,
                TextFormFieldWidget(
                  isFromRegisterPage: false,
                  usernameController: _usernameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                DynamicSpace.verticalSpace50,
                CustomButton(
                  text: PageText.loginText,
                  onPressed: handleLogin,
                  height: 100,
                ),
                DynamicSpace.verticalSpace50,
                RegisterWidget()
              ],
            ),
          ),
        );
      },
    ));
  }

  void handleLogin() async {
    List<String> _listUser = [];
    List<User> _userList;
    _userList = await _dbHelper.loadUser();

    _userList.forEach((data) {
      _listUser.add('${data.email!}${data.password!}');
    });

    String _user = '${_emailController.value}${_passwordController.value}';

    if (_emailController.value.isEmpty && _passwordController.value.isEmpty) {
      authContext!.read<AuthBlocCubit>()..login_failed(ErrorText.emptyFormText);
    } else if (!_emailController.value.contains('@')) {
      authContext!.read<AuthBlocCubit>()
        ..login_failed(ErrorText.validationEmailText);
    } else {
      if (_listUser.contains(_user)) {
        User user = User(
          email: _emailController.value,
          password: _passwordController.value,
        );
        authContext!.read<AuthBlocCubit>()..login_user(user);
      } else {
        authContext!.read<AuthBlocCubit>()
          ..login_failed(ErrorText.loginFailureText);
      }
    }
  }
}
