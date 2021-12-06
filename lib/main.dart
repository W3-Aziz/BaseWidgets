import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'asset/localization_service.dart';
import 'asset/them_service.dart';
import 'asset/thems.dart';
import 'route/routes.dart';
import 'ui/splash/splash_screen.dart';

void main() async {
  //If Flutter needs to call native code before calling runApp ensure initialize
  //WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setPathUrlStrategy();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialRoute: '/splash',
      getPages: routes(),
    ),
  );
}
