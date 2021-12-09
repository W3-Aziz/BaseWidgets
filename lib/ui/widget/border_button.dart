import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  VoidCallback onClick;
  VoidCallback? onLongPressed;
  String label;
  Color? labelColor;
  Color? labelDefaultColor;
  double radius;
  double thick;
  Color? borderColor;
  Color? borderColorDefault;
  Color bgColor;
  TextStyle labelStyle;

  //Set default property based on project requirement
  BorderButton({
    Key? key,
    required this.onClick,
    this.onLongPressed,
    this.labelColor,
    this.label = "This is border button",
    this.radius = 30.0,
    this.thick = 1.0,
    this.borderColor,
    this.bgColor = Colors.white,
    this.labelStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    labelDefaultColor = Theme.of(context).primaryColor;
    borderColorDefault = Colors.grey;
    return OutlinedButton(
      onPressed: onClick,
      onLongPress: onLongPressed,
      child: Text(label),
      style: OutlinedButton.styleFrom(
        primary: labelColor ?? labelDefaultColor, ///Button text color
        backgroundColor: bgColor,                 ///Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: BorderSide(
          width: thick,
          color: borderColor ?? borderColorDefault!,
          style: BorderStyle.solid,
        ),
        textStyle: labelStyle,
      ),
    );
  }
}
