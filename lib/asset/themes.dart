import '/asset/image_asset.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    /// Scaffold background color
    //scaffoldBackgroundColor: Colors.white,
    /// Application toolbar color
    appBarTheme: const AppBarTheme(
      color: Colors.amber,
    ),

    primaryColor: Colors.amber,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: FontFamily.pacifico,
        color: Colors.blue,
      ),
      bodyText2: TextStyle(
        fontFamily: FontFamily.pacifico,
        color: Colors.red,
      ),
      button: TextStyle(color: Colors.amber),
    ),

    /// Declare your app common card theme here
    /*cardTheme: CardTheme(
      color: Colors.deepOrange,   ///Background color
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0) /// Card corner radius
      ),
    ),*/

    /*iconTheme: const IconThemeData(
      color: Colors.deepOrange,
      size: 40,
    ),*/
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    buttonTheme: const ButtonThemeData(),
  );
}
