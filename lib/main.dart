import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login/login.dart';
import 'pages/login/login_controller.dart';

void main() async {
  //
  LoginController loginController = Get.put(LoginController());
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Linafoot Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginUtilisateur(),
    );
  }
}
