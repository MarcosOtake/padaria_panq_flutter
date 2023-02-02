import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/home/home_page.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class HomeRouters {
  HomeRouters._();
  static final homePage = <GetPage>[
    GetPage(
      name: Routers.homepage,
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => const HomePage(),
    ),
  ];
}
