import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:majootestcase/constant/constant.dart';

class FlushBar {
  static void flushBarView({
    BuildContext? context,
    String? message,
    bool? showIcon = true,
    Color? iconColor = Colors.red,
    Color? backgroundColor,
    TextStyle? textStyle,
    IconData? icon = Icons.info_outline,
    Widget? button,
    int? duration = 2,
    double? marginHorizonal = 8,
    double? marginVertical = 8,
    FlushbarPosition? position = FlushbarPosition.TOP,
    bool? isDismissible = false,
  }) {
    new Flushbar(
      isDismissible: isDismissible!,
      boxShadows: boxShadowGrey4,
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizonal!, vertical: marginVertical!),
      mainButton: button != null ? button : Container(),
      borderRadius: BorderRadius.circular(16),
      backgroundColor: backgroundColor == null ? Colors.white : backgroundColor,
      flushbarPosition: position!,
      messageText: Text(
        message!,
      ),
      icon: showIcon!
          ? Icon(
              icon,
              size: 28.0,
              color: iconColor == null ? Colors.red[800] : iconColor,
            )
          : Container(),
      duration: Duration(seconds: duration!),
    )..show(context!);
  }
}
