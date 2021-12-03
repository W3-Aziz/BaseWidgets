import 'package:flutter/material.dart';

class RoundCornerButton extends StatelessWidget {
  VoidCallback onClick;
  String label;
  double radius;
  Color bgColor;
  Color textColor;
  double elevation;
  EdgeInsetsGeometry padding;

  RoundCornerButton({
    Key? key,
    required this.onClick,
    this.label = "OK",
    this.radius = 30.0,
    this.bgColor = Colors.teal,
    this.textColor = Colors.white,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.only(left: 15.0, right: 15.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        primary: bgColor,
        onPrimary: textColor,
        shadowColor: Colors.black,
        elevation: elevation,
      ),
    );
  }
}
