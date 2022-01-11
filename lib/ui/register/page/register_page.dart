import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:majootestcase/bloc/register_bloc/register_bloc_cubit.dart';
import 'package:majootestcase/common/widget/custom_button.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';
import 'package:majootestcase/constant/constant.dart';
import 'package:majootestcase/models/user.dart';
import 'package:majootestcase/ui/home/page/home_page.dart';
import 'package:majootestcase/utils/dynamic_space.dart';
import 'package:majootestcase/utils/flushbar_widget.dart';
import 'package:majootestcase/utils/text_form_field_widget.dart';
import 'package:majootestcase/utils/text_styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<RegisterPage> {
  BuildContext? registerContext;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final _emailController = TextController('');
  final _userNameController = TextController('');
  final _passwordController = TextController('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<RegisterBlocCubit, RegisterBlocState>(
      listener: (c, state) {
        if (state is RegisterBlocErrorState) {
          FlushBar.flushBarView(context: c, message: state.error);
        }

        if (state is RegisterBlocSuccesState) {
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
          FlushBar.flushBarView(context: c, message: state.success);
        }
      },
      builder: (context, state) {
        registerContext = context;
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
                  isFromRegisterPage: true,
                  usernameController: _userNameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                DynamicSpace.verticalSpace50,
                CustomButton(
                  text: PageText.signUpText,
                  onPressed: handleRegister,
                  height: 100,
                ),
                DynamicSpace.verticalSpace50,
              ],
            ),
          ),
        );
      },
    ));
  }

  void handleRegister() async {
    final _email = _emailController.value;
    final _username = _userNameController.value;
    final _password = _passwordController.value;

    if (_email.isEmpty && _password.isEmpty && _email.isEmpty) {
      registerContext!.read<RegisterBlocCubit>()
        ..register_failed(ErrorText.emptyFormText);
    } else if (!_email.contains('@')) {
      registerContext!.read<RegisterBlocCubit>()
        ..register_failed(ErrorText.validationEmailText);
    } else {
      if (_username.isNotEmpty && _password.isNotEmpty && _email.isNotEmpty) {
        User user = User(
          email: _email,
          password: _password,
          userName: _username,
        );
        registerContext!.read<RegisterBlocCubit>()
          ..register_user(user, SuccessText.successRegistText);
      } else {
        registerContext!.read<RegisterBlocCubit>()
          ..register_failed(ErrorText.emptyFormText);
      }
    }
  }
}
