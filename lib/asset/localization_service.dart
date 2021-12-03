import 'dart:ui';

import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // FallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('tr', 'TR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Turkey',
    '日本語',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
    const Locale('ja', 'JP'),
  ];

  // Keys and their translations
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': "Hello word english",
      'home': 'Home english'
    },
    'tr_TR': {
      'hello': "Hello word turkey",
      'home': 'Home turkey'
    },
    'ja_JP': {
      'hello': "Hello word japans",
      'home': 'Home japans'
    },
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
