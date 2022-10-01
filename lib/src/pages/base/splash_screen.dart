import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            alignment: Alignment.center,
            color: CustomColors.aplopesBasicColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/app_images/logo.svg',),
              ]
            ),
          ),
    );
  }
}
