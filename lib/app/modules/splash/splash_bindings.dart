import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
