import 'package:get/get.dart';
import 'package:padaria_panq/app_teste/screens/home/home_bindings.dart';
import 'package:padaria_panq/app_teste/screens/nav_botton/bottom_nav_bindings.dart';
import 'package:padaria_panq/app_teste/screens/new_product/new_product_bindings.dart';
import 'package:padaria_panq/app_teste/screens/new_product/new_product_screen.dart';

class NewProduct {
  NewProduct._();

  static final newProduct = GetPage(
    bindings: [
      HomeBindings(),
      BottomNavBindings(),
      NewProductBindings(),
    ],
    name: '/new-product',
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
    page: () => const NewProductScreen(),
  );
}
