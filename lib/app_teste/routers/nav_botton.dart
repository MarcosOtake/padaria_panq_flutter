import 'package:get/get.dart';
import 'package:padaria_panq/app_teste/screens/home/home_bindings.dart';
import 'package:padaria_panq/app_teste/screens/nav_botton/bottom_nav_bindings.dart';
import 'package:padaria_panq/app_teste/screens/screens.dart';

class NavBotton {
  NavBotton._();

  static final navbottom = GetPage(
    bindings: [
      HomeBindings(),
      BottomNavBindings(),
    ],
    name: '/',
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
    page: () => const BottomNavScreen(),
  );
}
