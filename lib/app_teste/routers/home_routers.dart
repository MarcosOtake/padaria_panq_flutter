import 'package:get/get.dart';
import 'package:padaria_panq/app_teste/screens/home/home_bindings.dart';
import 'package:padaria_panq/app_teste/screens/screens.dart';

class HomeRouters {
  HomeRouters._();

  static final homePage = GetPage(
    binding: HomeBindings(),
    name: '/home-screen',
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
    page: () => const HomeScreen(),
  );
}
