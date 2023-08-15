import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.signOut();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    FirebaseAuth.instance.signOut();
  }

  void increment() => count.value++;
}
