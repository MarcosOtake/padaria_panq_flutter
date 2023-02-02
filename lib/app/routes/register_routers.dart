import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/auth/register/register_page.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class RegisterRouters {
  RegisterRouters._();
  static final register = GetPage(
    name: Routers.register,
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
    page: () => const RegisterPage(),
  );
}
