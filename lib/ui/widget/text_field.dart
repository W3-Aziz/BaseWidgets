import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class BaseTextField extends StatelessWidget {
  Function? onChange;
  Function? onSubmit;
  TextEditingController? controller;
  double radius;
  Widget? prefix;
  Widget? suffix;
  TextInputType inputType;
  EdgeInsets padding;
  Color borderColor;

  BaseTextField({
    Key? key,
    this.onChange,
    this.onSubmit,
    this.controller,
    this.radius = 30.0,
    this.prefix,
    this.suffix,
    this.inputType = TextInputType.text,
    this.padding = const EdgeInsets.all(10.0),
    this.borderColor = CupertinoColors.inactiveGray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: padding,
      controller: controller,
      placeholder: "Enter your name",
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      onSubmitted: (value) {
        if (onSubmit != null) {
          onSubmit!(value);
        }
      },
      prefix: prefix,
      /*const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          CupertinoIcons.phone_solid,
        ),
      )*/
      suffix: suffix,
      keyboardType: inputType,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
