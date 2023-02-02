import 'package:get/get.dart';
import 'package:padaria_panq/app_teste/data/models/product_model.dart';

class NewProductController extends GetxController {
  final _products = <ProductModel>[].obs;

  var isProductImagePath = false.obs;
  var productPicPath = ''.obs;

  RxList<ProductModel> get products => _products;

  void setProductImagePath(String path) {
    productPicPath.value = path;
    isProductImagePath.value = true;
    refresh();
  }

  saveBox(String name, int id, String image, DateTime dateTime) async {
    final product = ProductModel(
      nomeProduto: name,
      id: id,
      image: image,
      date: dateTime,
    );

    products.add(product);
    refresh();
  }

  readBox() async {
    // _products.value = box.getAll() as List<ProductModel>;
  }

  updateBox(ProductModel productModel) async {
    products.add(productModel);
  }

  deleteBox(ProductModel productModel) async {
    products.remove(productModel);
    refresh();
  }
}
