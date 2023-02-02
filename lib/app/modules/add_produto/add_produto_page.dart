import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/padaria_ui_theme.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_app_bar.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class AddProdutoPage extends StatelessWidget {
  const AddProdutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PadariaAppBar(
        title: 'Criar Produtos',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            card('Criar novos produtos', Routers.novoProduto),
            card('Criar novas receitas', Routers.novoProduto),
          ],
        ),
      ),
    );
  }

  Widget card(String text, String routers) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(Routers.novoProduto);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    Text(
                      text,
                      style: PadariaUiTheme.textBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
