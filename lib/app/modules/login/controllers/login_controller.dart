import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  TextEditingController userTxtCtlr = TextEditingController();
  TextEditingController userSignUpTxtCtlr = TextEditingController();
  TextEditingController passwordTxtCtlr = TextEditingController();
  TextEditingController passwordSignUpTxtCtlr = TextEditingController();
  TextEditingController emailSignUpTxtCtlr = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxBool isObsecure = true .obs;
  late var scaffoldKey = GlobalKey<ScaffoldState>();

  void eyeSwitch()
  {
    isObsecure.value = !isObsecure.value;
  }

  Future signIn () async {

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: userTxtCtlr.text.trim(), password: passwordTxtCtlr.text.trim());
    }
    on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}
