import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:zestypantry/app/modules/home/controllers/home_controller.dart';
import 'package:zestypantry/app/modules/login/controllers/login_controller.dart';

class StartUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
  }
}