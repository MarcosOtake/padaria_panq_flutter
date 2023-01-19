import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  // final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: const Color(0xFF000000), //#AA5C31
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/pao-fundo.png',
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: context.heightTransformer(reducedBy: 99.9)),
                Image.asset(
                  'assets/images/logo-pan_q.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PadariaButton(
                    onPressed: () {
                      Get.toNamed(Routes.auth);
                    },
                    label: 'ACESSAR',
                    width: context.widthTransformer(reducedBy: 10),
                    height: 45,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
