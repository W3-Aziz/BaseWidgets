import 'package:flutter/material.dart';

/// <h1>Base raised button class</h1>
/// VoidCallBack is compulsory parameter
/// Others are optional

class RoundCornerButton extends StatelessWidget {
  VoidCallback onClick;
  VoidCallback? onLongPressed;
  String label;
  double radius;
  Color? bgColor;
  Color textColor;
  double elevation;
  EdgeInsetsGeometry padding;
  bool isEnable;
  Color disableColor;
  Color? defaultColor;
  TextStyle labelStyle;

  RoundCornerButton({
    Key? key,
    required this.onClick,
    this.onLongPressed,
    this.label = "OK",
    this.radius = 30.0,
    this.bgColor,
    this.textColor = Colors.white,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.only(left: 15.0, right: 15.0),
    this.isEnable = true,
    this.disableColor = Colors.grey,
    this.labelStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    defaultColor = Theme.of(context).primaryColor;
    return ElevatedButton(
      onPressed: isEnable ? onClick : null,
      onLongPress: onLongPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        primary: bgColor ?? defaultColor,
        onPrimary: textColor,
        shadowColor: Colors.black,
        elevation: elevation,
        textStyle: labelStyle,
      ),
    );
  }
}
