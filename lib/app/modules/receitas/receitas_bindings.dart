import 'package:get/get.dart';
import './receitas_controller.dart';

class ReceitasBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ReceitasController());
    }
}