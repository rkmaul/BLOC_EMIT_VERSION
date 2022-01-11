import 'package:flutter/material.dart';

class Preference {
  static const USER_INFO = "user-info";
}

class Api {
  static const BASE_URL = "";
  static const LOGIN = "/login";
  static const REGISTER = "/register";
}

class Font {}

class ScreenUtilConstants {
  static const width = 320.0;
  static const height = 640.0;
}

const boxShadowGrey4 = const [
  BoxShadow(
    color: Colors.grey,
    blurRadius: 4.0,
  ),
];

class PageText {
  static const welcomeText = 'Selamat Datang';
  static const pleaseLoginFirst = 'Silahkan login terlebih dahulu';
  static const loginText = 'Login';
  static const dontHaveAccountText = 'Belum punya akun? ';
  static const signUpText = 'Daftar';
  static const movieDetailTex = 'Detail Movie';
}

class ErrorText {
  static const validationEmailText = 'Masukan e-mail yang valid';
  static const loginFailureText = 'Login gagal, periksa kembali inputan Anda';
  // static const wrongPasswordText = 'Password yang Anda masukan salah';
  static const emptyFormText =
      "Form tidak boleh kosong, mohon check kembali data yang Anda inputkan";

  static const errorConnectionText =
      "Mohon periksa kembali\njaringan internet Anda";
}

class SuccessText {
  static const successRegistText = "Register Berhasil";
}
