import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class LoginController extends GetxController {
  // final _formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController().obs;
  final senhaEC = TextEditingController().obs;
  String email = 'gordo@email.com';
  String senha = '123456';
  var isloading = false.obs;
  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    isloading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    var boxLogin = await box.read('login');
    if (boxLogin != null &&
        boxLogin['email'] == email &&
        boxLogin['senha'] == senha) {
      await Get.offAndToNamed(Routers.homepage);
    }
    isloading.value = false;
    super.onReady();
  }

  @override
  void dispose() {
    emailEC.close();
    senhaEC.close();
    super.dispose();
  }
}
