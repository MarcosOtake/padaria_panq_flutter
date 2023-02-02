import 'package:get/get.dart';
import './home_list_cards_controller.dart';

class HomeListCardsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(HomeListCardsController());
    }
}