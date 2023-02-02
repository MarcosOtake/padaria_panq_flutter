import 'package:get/get.dart';
import './vendas_controller.dart';

class VendasBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(VendasController());
    }
}