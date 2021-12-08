import 'package:base_widget/asset/image_asset.dart';
import 'package:base_widget/asset/them_service.dart';
import 'package:base_widget/data/local/db_manager.dart';
import 'package:base_widget/data/local/model/user.dart';
import 'package:base_widget/data/remote/api_constant.dart';
import 'package:base_widget/data/remote/network_manager.dart';
import 'package:base_widget/ui/widget/border_button.dart';
import 'package:base_widget/ui/widget/round_button.dart';
import 'package:base_widget/ui/widget/text_field.dart';
import 'package:base_widget/util/image_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  late DBManager dbManager;
  late NetManager _netManager;

  @override
  void initState() {
    super.initState();
    dbManager = DBManager();
    _netManager = NetManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.teal,
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
        padding: EdgeInsets.only(top: 2.h),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
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
                onClick: () {
                  setState(() {
                    ThemeService().switchTheme();
                  });
                },
                label: "Them change",
              ),
              const SizedBox(
                height: 10.0,
              ),
              BorderButton(
                onClick: () async {
                  /*var user = User(
                      name: "Aziz",
                      email: "example@gmail.com",
                      phone: "01923456789");
                  var value = await dbManager.addUser(user);
                  print("User added success : $value");*/

                  //var users = await dbManager.getAllUsers();
                  //print("User added success : ${users.length}");

                  //_netManager.fetchUsers();
                  _netManager.getRequest(api: ApiConstant.userApi);

                },
                label: "Language change",
                labelStyle: const TextStyle(fontFamily: FontFamily.pacifico),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BaseTextField(
                  onChange: (value) {
                    print("Change value is here: $value");
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ImageUtil.loadImage(
                url: 'https://loremflickr.com/100/100/music?lock=5',
                radius: 20.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ImageUtil.loadImage(
                url: 'https://loremflickr.com/100/100/music?lock=5',
                width: 100.0,
                height: 100.0,
                radius: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ImageUtil.showAvatar(assetImg: HomeAsset.w3Icon),
              const SizedBox(
                height: 20.0,
              ),
              ImageUtil.showAvatar(child: Text("M"), bgColor: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}
