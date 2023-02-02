import 'package:get/get.dart';
import 'package:padaria_panq/app/routes/routers.dart';
import 'package:padaria_panq/app/shared/botton_navigation_bar_default/botton_navigation_bar_default/botton_navigation_bar_default_bindings.dart';
import 'package:padaria_panq/app/shared/botton_navigation_bar_default/botton_navigation_bar_default/botton_navigation_bar_default_page.dart';

class NavigationBarRouters {
  NavigationBarRouters._();
  static final navigationBar = GetPage(
    binding: BottonNavigationBarDefaultBindings(),
    name: Routers.navigationBar,
    page: () => const BottonNavigationBarDefaultPage(),
  );
}
