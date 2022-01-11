import 'package:flutter/material.dart';
import 'package:majootestcase/utils/screen_size.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final double? height;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final OutlinedBorder? shapeBorder;
  final bool? isSecondary;
  final bool? isOutline;

  const CustomButton({
    Key? key,
    this.text,
    this.height = 40,
    this.onPressed,
    this.leadingIcon,
    this.shapeBorder,
    this.isSecondary = false,
    this.isOutline = false,
  }) : super(key: key);

  const CustomButton.outline({
    Key? key,
    this.text,
    this.height = 40,
    this.onPressed,
    this.leadingIcon,
    this.shapeBorder,
    this.isSecondary = false,
    this.isOutline = true,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final color = widget.isSecondary! ? Colors.transparent : primaryColor;
    return Container(
      width: screenWidth(context),
      child: ButtonTheme(
        height: widget.height!,
        buttonColor: color,
        minWidth: double.infinity,
        child: widget.isOutline!
            ? OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: color,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: _shapeBorder(context),
                ).copyWith(
                    side: MaterialStateProperty.all(BorderSide(
                  color: _color(context),
                  width: 2,
                ))),
                icon: widget.leadingIcon ?? const SizedBox(),
                label: _label(context),
                onPressed: widget.onPressed)
            : TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: color,
                  shape: _shapeBorder(context),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onSurface: Colors.grey,
                ),
                icon: widget.leadingIcon ?? const SizedBox(),
                label: _label(context),
                onPressed: widget.onPressed),
      ),
    );
  }

  OutlinedBorder _shapeBorder(BuildContext context) =>
      widget.shapeBorder ??
      RoundedRectangleBorder(
        side: widget.isSecondary!
            ? BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
                style: BorderStyle.solid)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      );

  Widget _label(BuildContext context) {
    return Text(
      widget.text!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(color: _color(context)),
    );
  }

  Color _color(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final color = widget.isSecondary! ? Colors.transparent : primaryColor;
    return widget.isSecondary!
        ? primaryColor
        : color.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white;
  }
}
