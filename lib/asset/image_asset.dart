//Write each asset access class based on screen name
//So that other developer can easily access

class FontFamily{
  ///Private constructor to prevent obj call
  FontFamily._();
  static const pacifico = 'Pacifico';
}
class HomeAsset {
  ///Private constructor to prevent obj call
  HomeAsset._();
  static const _asset = "assets/home/";
  static const w3Icon = "${_asset}launcher_icon.png";
}
