import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_app_bar.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_text_form_field.dart';
import 'package:padaria_panq/app/modules/auth/login/login_controller.dart';
import 'package:padaria_panq/app/routes/routers.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  var controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PadariaAppBar(
        elevation: 0,
      ),
      body: Obx(() {
        return controller.isloading.value
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(
                builder: (_, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
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
                                PadariaTextFormField(
                                  label: 'E-mail',
                                  controller: controller.emailEC,
                                  validator: Validatorless.multiple([
                                    Validatorless.required(
                                        'Email é obrigatório'),
                                    Validatorless.email(
                                        'Favor insira um email válido'),
                                  ]),
                                ),
                                const SizedBox(height: 30),
                                PadariaTextFormField(
                                  label: 'Senha',
                                  controller: controller.senhaEC,
                                  validator: Validatorless.multiple([
                                    Validatorless.required(
                                        'Senha é obrigatória'),
                                    Validatorless.min(6,
                                        'A senha deve ter mais de 6 digitos'),
                                  ]),
                                ),
                                const SizedBox(height: 50),
                                Center(
                                  child: PadariaButton(
                                    onPressed: () {
                                      var loginPersit = <String, dynamic>{
                                        'email': controller.emailEC.value.text,
                                        'senha': controller.senhaEC.value.text
                                      };
                                      var _formIsValid =
                                          _formKey.currentState?.validate() ??
                                              false;
                                      if (_formIsValid &&
                                          controller.emailEC.value.text ==
                                              controller.email &&
                                          controller.senhaEC.value.text ==
                                              controller.senha) {
                                        controller.box
                                            .write('login', loginPersit);
                                        Get.snackbar(
                                          'Sucesso!',
                                          'Usuário autenticado!',
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white,
                                          duration: const Duration(seconds: 3),
                                        );
                                        // var meulogin = <String, String>{
                                        //   'email': _emailEC.text,
                                        //   'senha': _senhaEC.text
                                        // };
                                        // for (final item in meulogin.entries) {
                                        //   mapLogin.putIfAbsent(
                                        //       item.key, () => item.value);
                                        // }
                                        debugPrint(
                                            '${loginPersit['email']}   ${loginPersit['senha']}');
                                        var valueBox =
                                            controller.box.read('login');
                                        debugPrint(valueBox.toString());
                                        Get.offAndToNamed(Routers.homeCards);
                                      } else {
                                        Get.snackbar(
                                          'Falha de autenticação',
                                          'Favor verifique seu e-mail ou senha',
                                          backgroundColor: Colors.redAccent,
                                          colorText: Colors.white,
                                          duration: const Duration(seconds: 4),
                                        );
                                      }
                                    },
                                    label: 'ENTRAR',
                                    width: context.width,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
