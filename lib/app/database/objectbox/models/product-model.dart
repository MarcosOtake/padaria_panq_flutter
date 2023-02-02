import 'package:intl/intl.dart';

//import 'package:padaria_panq/app/database/object_box/tipo_produtos.dart';

class ProductModel {
  int? id;
  String? nomeProduto;
  String? image;
  DateTime date;

  ProductModel({this.nomeProduto, this.id = 0, this.image, DateTime? date})
      : date = date ?? DateTime.now();

  String get dateFormat => DateFormat('dd.MM.yyyy').format(date);

  // final tipoProduto = ToOne<TipoProdutos>();
}
