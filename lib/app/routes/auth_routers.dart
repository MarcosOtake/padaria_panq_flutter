import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/auth/login/login_bindings.dart';
import 'package:padaria_panq/app/modules/auth/login/login_page.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class AuthRouters {
  AuthRouters._();
  //bool get validateLogin => _validateLogin();

  static final loginPage = <GetPage>[
    GetPage(
      name: Routers.authLogin,
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
  ];
}
