import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() async {
    // var box = await Get.putAsync(() async {
    //   return ObjectBox();
    // });
    // Get.lazyPut(() => HomeController(boxDatabase: box));
  }
}
