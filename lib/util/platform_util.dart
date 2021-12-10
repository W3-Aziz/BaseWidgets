import 'package:flutter/foundation.dart' as platform;
import 'package:flutter/material.dart';

class PlatformUtil {
  PlatformUtil._();

  static bool get isIos => platform.defaultTargetPlatform == TargetPlatform.iOS;

  static bool get isAndroid =>
      platform.defaultTargetPlatform == TargetPlatform.iOS;
}
