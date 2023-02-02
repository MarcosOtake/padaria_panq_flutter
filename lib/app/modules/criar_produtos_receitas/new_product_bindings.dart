import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/criar_produtos_receitas/new_product_controller.dart';

class NewProductBindings implements Bindings {
  // late final ObjectBox objectbox;
  @override
  void dependencies() async {
    Get.lazyPut(() => NewProductController);
  }
}
