import 'package:base_widget/ui/splash/splash_screen.dart';
import 'package:base_widget/ui/wrapper/choose_route.dart';
import 'package:get/get.dart';


routes() => [
      GetPage(name: "/splash", page: () => const SplashScreen()),
      GetPage(name: "/decision", page: () => const ChooseRoute()),
    ];


//Get.toNamed("/products/${item.dbId}");
//GetPage(name: "/products/:id", page: () => ProductDetail()),
