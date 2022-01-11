import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final double? height;
  final Color? color;

  const LoaderWidget({Key? key, this.height = 10, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: Center(
        child: CircularProgressIndicator(strokeWidth: 10),
      ),
    );
  }
}
