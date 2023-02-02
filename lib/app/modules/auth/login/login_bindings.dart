import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/auth/login/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
