import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/shared/botton_navigation_bar_default/botton_navigation_bar_default/botton_navigation_bar_default_page.dart';

class BottonNavigationBarDefaultController extends GetxController {
  final controller = Get.lazyPut(() => const BottonNavigationBarDefaultPage());
  @override
  void onReady() {
    debugPrint('onReady');
    super.onReady();
  }
}
