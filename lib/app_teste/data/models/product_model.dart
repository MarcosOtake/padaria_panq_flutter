// import 'package:intl/intl.dart';
// import 'package:objectbox/objectbox.dart';
// //import 'package:padaria_panq/app/database/object_box/tipo_produtos.dart';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
// @Entity()
// class ProductModel {
//   int? id;
//   String? nomeProduto;
//   String? image;
//   DateTime date;

//   ProductModel({this.nomeProduto, this.id = 0, this.image, DateTime? date})
//       : date = date ?? DateTime.now();

//   String get dateFormat => DateFormat('dd.MM.yyyy').format(date);
// }
@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  String? nomeProduto;
  @HiveField(2)
  String? image;
  @HiveField(3)
  DateTime date;

  ProductModel({this.nomeProduto, this.id = 0, this.image, DateTime? date})
      : date = date ?? DateTime.now();

  String get dateFormat => DateFormat('dd.MM.yyyy').format(date);
}
