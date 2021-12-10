import 'package:permission_handler/permission_handler.dart';

class AccessManager {
  AccessManager._();

  static Future<Status> ask(Permission permission) async {
    var state = await permission.status;
    if (state.isGranted) {
      return Status.granted;
    }
    if (state.isDenied) {
      state = await _ask(permission);
      if (state.isGranted) {
        return Status.granted;
      } else if (state.isDenied) {
        return Status.denied;
      } else if (state.isPermanentlyDenied) {
        return Status.permanentlyDenied;
      }
    } else if (state.isLimited) {
      return Status.limited;
    } else if (state.isRestricted) {
      return Status.restricted;
    } else {
      return Status.permanentlyDenied;
    }
    return Status.permanentlyDenied;
  }
}

Future<PermissionStatus> _ask(Permission permission) {
  return permission.request();
}

enum Status {
  /// The user denied access to the requested feature.
  denied,

  /// The user granted access to the requested feature.
  granted,

  /// The OS denied access to the requested feature. The user cannot change
  /// this app's status, possibly due to active restrictions such as parental
  /// controls being in place.
  /// *Only supported on iOS.*
  restricted,

  ///User has authorized this application for limited access.
  /// *Only supported on iOS (iOS14+).*
  limited,

  /// Permission to the requested feature is permanently denied, the permission
  /// dialog will not be shown when requesting this permission. The user may
  /// still change the permission status in the settings.
  /// *Only supported on Android.*
  permanentlyDenied,
}
