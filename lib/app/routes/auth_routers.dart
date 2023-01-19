import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/auth/login/login_page.dart';
import 'package:padaria_panq/app/modules/auth/register/register_page.dart';

class AuthRouters {
  AuthRouters._();

  static final loginPage = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
    )
  ];
}
