import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Get.offNamed(PagesRoutes.signIngRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            alignment: Alignment.center,
            color: CustomColors.aplopesBasicColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/app_images/app_icon.png',),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ]
            ),
          ),
    );
  }
}
