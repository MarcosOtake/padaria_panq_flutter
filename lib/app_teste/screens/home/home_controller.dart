import 'package:get/get.dart';
import 'package:padaria_panq/app_teste/data/models/product_model.dart';

class HomeController extends GetxController {
  final _products = <ProductModel>[].obs;

  List<ProductModel> get products => _products;

  // Future<Box> getBox() async {
  //   final store = await boxDatabase?;
  //   return store!.box<ProductModel>();
  // }

  // saveBox(String name, int id, File? image, DateTime dateTime) async {
  //   final product = ProductModel(
  //     nomeProduto: name,
  //     id: id,
  //     image: image,
  //     date: dateTime,
  //   );
  //   final box = await getBox();
  //   box.put(product);
  //   products.add(product);
  // }

  // readBox() async {
  //   final box = await getBox();
  //   _products.value = box.getAll() as List<ProductModel>;
  // }

  // updateBox(ProductModel productModel) async {
  //   final box = await getBox();
  //   box.put(productModel);
  //   products.add(productModel);
  // }

  // deleteBox(ProductModel productModel) async {
  //   final box = await getBox();
  //   box.remove(productModel.id!);
  //   products.remove(productModel);
  //   refresh();
  // }
}
