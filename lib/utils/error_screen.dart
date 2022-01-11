// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:majootestcase/utils/dynamic_space.dart';
import 'package:majootestcase/utils/text_styles.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  final Function()? retry;
  final Color? textColor;
  final double? fontSize;
  final double? gap;
  final Widget? retryButton;

  const ErrorScreen(
      {Key? key,
      this.gap = 10,
      this.retryButton,
      this.message = "",
      this.fontSize = 14,
      this.retry,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message!,
                  style: normalFont16Bold,
                ),
                DynamicSpace.horizontalSpace10,
                Icon(Icons.wifi_off_sharp)
              ],
            ),
            retry != null
                ? IconButton(
                    iconSize: 32,
                    onPressed: () {
                      if (retry != null) retry!();
                    },
                    icon: Icon(Icons.refresh_sharp),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
