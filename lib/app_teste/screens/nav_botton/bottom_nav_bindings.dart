import 'package:get/get.dart';
import 'package:padaria_panq/app_teste/screens/nav_botton/bottom_nav_controller.dart';

class BottomNavBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }
}
