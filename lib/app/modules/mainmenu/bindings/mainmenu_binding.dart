import 'package:get/get.dart';

import '../controllers/mainmenu_controller.dart';

class MainmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainmenuController>(
      () => MainmenuController(),
    );
  }
}
