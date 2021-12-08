import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// By default touch scroll is enable both in mobile and pc
/// In pc normal mouse pointer scroll is not enable. We need to enable
/// It programmatically
class ScrollConfigWith extends StatelessWidget {
  Widget child;

  ScrollConfigWith({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: child,
    );
  }
}
