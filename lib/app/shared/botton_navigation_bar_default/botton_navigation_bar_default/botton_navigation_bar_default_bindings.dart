import 'package:get/get.dart';
import 'botton_navigation_bar_default_controller.dart';

class BottonNavigationBarDefaultBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottonNavigationBarDefaultController());
  }
}
