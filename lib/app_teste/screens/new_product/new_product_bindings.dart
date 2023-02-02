import 'package:get/get.dart';
import './new_product_controller.dart';

class NewProductBindings implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => NewProductController());
  }
}
