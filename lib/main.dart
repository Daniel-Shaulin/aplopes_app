import 'package:aplopes_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aplopes_app/src/pages/auth/view/sign_in_screen.dart';
import 'package:aplopes_app/src/config/custom_colors.dart';
import 'package:aplopes_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplopes',
      theme: ThemeData(
        primarySwatch: CustomColors.aplopesBasicColor
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPage.pages,
      initialRoute: PagesRoutes.splashRoute,
    );
  }
}
