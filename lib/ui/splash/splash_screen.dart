import 'package:base_widget/asset/image_asset.dart';
import 'package:base_widget/ui/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontFamily: FontFamily.pacifico,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontSize: 30),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(HomeAsset.w3Icon),
            ),
            const Text(
              "Aladeen Khan",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 2.5,
              ),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            RoundCornerButton(
              onClick: (){
                print("Button clicked++++");
              },
              label: "SIGNUP",
            ),
          ],
        ),
      ),
    );
  }
}
