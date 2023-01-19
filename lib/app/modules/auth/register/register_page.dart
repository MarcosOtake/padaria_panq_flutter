import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_app_bar.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PadariaAppBar(
        elevation: 0,
      ),
      body: IntrinsicHeight(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Preencha os campos abaixo para criar seu cadastro.',
                  style: context.textTheme.bodyText2?.copyWith(
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const SizedBox(height: 30),
                const PadariaTextFormField(label: 'Nome'),
                const SizedBox(height: 30),
                const PadariaTextFormField(label: 'E-mail'),
                const SizedBox(height: 30),
                const PadariaTextFormField(label: 'Senha'),
                const SizedBox(height: 30),
                const PadariaTextFormField(label: 'Confirme sua Senha'),
                const SizedBox(height: 50),
                const Spacer(flex: 4),
                PadariaButton(
                  onPressed: () {},
                  label: 'CADASTRAR',
                  width: context.width,
                ),
                const SizedBox(height: 60)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
