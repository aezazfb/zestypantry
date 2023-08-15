import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/bindings/initial.dart';
import 'package:zestypantry/app/data/functionalities/firebaseMessaging.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseApi().initNotification();


  runApp(
    GetMaterialApp(
      initialBinding: StartUpBinding(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
