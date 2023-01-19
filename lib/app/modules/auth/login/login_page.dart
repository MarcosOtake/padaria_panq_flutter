import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/padaria_ui_theme.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_app_bar.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_text_form_field.dart';
import 'package:padaria_panq/app/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PadariaAppBar(
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const PadariaTextFormField(label: 'E-mail'),
                      const SizedBox(height: 30),
                      const PadariaTextFormField(label: 'Senha'),
                      const SizedBox(height: 50),
                      Center(
                        child: PadariaButton(
                          onPressed: () {},
                          label: 'ENTRAR',
                          width: context.width,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui uma conta?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.register);
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: PadariaUiTheme.textBold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
