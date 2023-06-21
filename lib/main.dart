import 'package:bank_app/pages/repository/auth_repo.dart';
import 'package:bank_app/pages/controllers/controller.dart';
import 'package:bank_app/pages/controllers/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'pages/data_and_other_useful_pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(SignUpController());
  Get.put(LoginController());
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // ignore: prefer_const_constructors
      home: Splash(),
    );
  }
}
