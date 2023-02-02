import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/add_produto/add_produto_page.dart';
import 'package:padaria_panq/app/modules/criar_produtos_receitas/new_product_bindings.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class AddProductRouters {
  AddProductRouters._();

  static final addproduct = GetPage(
    binding: NewProductBindings(),
    name: Routers.addproduct,
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
    page: () => const AddProdutoPage(),
  );
}
