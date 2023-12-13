import 'package:get/get.dart';

import '../controllers/foods_home_controller.dart';

class FoodsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodsHomeController>(
      () => FoodsHomeController(),
    );
  }
}
