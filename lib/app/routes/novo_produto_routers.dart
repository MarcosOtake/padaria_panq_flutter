import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/criar_produtos_receitas/new_product_bindings.dart';
import 'package:padaria_panq/app/modules/criar_produtos_receitas/new_product.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class NovoProdutoRouters {
  NovoProdutoRouters._();
  static final novoProduto = GetPage(
      binding: NewProductBindings(),
      name: Routers.novoProduto,
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => NewProduct());
}
