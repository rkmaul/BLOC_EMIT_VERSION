// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:majootestcase/common/widget/text_form_field.dart';

class TextFormFieldWidget extends StatefulWidget {
  final bool? isFromRegisterPage;
  final TextController? emailController;
  final TextController? usernameController;
  final TextController? passwordController;
  const TextFormFieldWidget(
      {Key? key,
      this.emailController,
      this.passwordController,
      this.usernameController,
      this.isFromRegisterPage})
      : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  GlobalKey<FormState>? formKey = new GlobalKey<FormState>();

  bool _isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          widget.isFromRegisterPage == true
              ? CustomTextFormField(
                  context: context,
                  controller: widget.usernameController,
                  isEmail: true,
                  hint: 'username',
                  label: 'Username',
                  validator: (val) {
                    final pattern =
                        new RegExp(r'([\d\w]{1,}@[\w\d]{1,}\.[\w]{1,})');
                    if (val != null)
                      return pattern.hasMatch(val) ? null : 'email is invalid';
                  },
                )
              : Container(),
          CustomTextFormField(
            context: context,
            controller: widget.emailController,
            isEmail: true,
            hint: 'Example@123.com',
            label: 'Email',
            validator: (val) {
              final pattern = new RegExp(r'([\d\w]{1,}@[\w\d]{1,}\.[\w]{1,})');
              if (val != null)
                return pattern.hasMatch(val) ? null : 'email is invalid';
            },
          ),
          CustomTextFormField(
            context: context,
            label: 'Password',
            hint: 'password',
            controller: widget.passwordController,
            isObscureText: _isObscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _isObscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: () {
                setState(() {
                  _isObscurePassword = !_isObscurePassword;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
