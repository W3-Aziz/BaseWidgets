import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

import 'asset/localization_service.dart';
import 'asset/them_service.dart';
import 'asset/themes.dart';
import 'route/routes.dart';

void main() async {

  //WidgetsFlutterBinding.ensureInitialized();                  /// If Flutter needs to call native code before calling runApp ensure initialize
  await GetStorage.init();
  setPathUrlStrategy();                                         /// Specially for web project
  runApp(
    Sizer(
      builder: (context, orientation, device) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.light,                                  /// Default theme application will start with it
          darkTheme: Themes.dark,
          themeMode: ThemeService().theme,
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          defaultTransition: Transition.rightToLeft,             /// Screen transition animation define here
          transitionDuration: const Duration(milliseconds: 500), /// Change transition duration
          initialRoute: '/splash',                               /// Start screen
          getPages: routes(),                                    /// All route list
        );
      },
    ),
  );
}
