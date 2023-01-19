import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/padaria_ui_theme.dart';
import 'package:padaria_panq/app/routes/auth_routers.dart';
import 'package:padaria_panq/app/routes/splash_routers.dart';

void main() {
  runApp(const PadariaPanQ());
}

class PadariaPanQ extends StatelessWidget {
  const PadariaPanQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Padaria PanQ',
      theme: PadariaUiTheme.theme,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.loginPage,
      ],
    );
  }
}
