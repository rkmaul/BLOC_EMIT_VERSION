import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majootestcase/bloc/register_bloc/register_bloc_cubit.dart';
import 'package:majootestcase/constant/constant.dart';
import 'package:majootestcase/ui/register/page/register_page.dart';
import 'package:majootestcase/utils/text_styles.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () async {
          FocusScope.of(context).requestFocus(new FocusNode());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) =>
                    RegisterBlocCubit()..register_user(null, ''),
                child: RegisterPage(),
              ),
            ),
          );
        },
        child: RichText(
          text: TextSpan(
              text: PageText.dontHaveAccountText,
              style: normalFontBlack45,
              children: [
                TextSpan(
                  text: PageText.signUpText,
                ),
              ]),
        ),
      ),
    );
  }
}
