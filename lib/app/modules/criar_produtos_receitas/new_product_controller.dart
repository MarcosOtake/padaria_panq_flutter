import 'package:get/get.dart';

class NewProductController extends GetxController {
//   late final Box<ProductModel> produtoBox;

//   NewProductController._create(this.store) {
//     produtoBox = Box<ProductModel>(store);

//     if (produtoBox.isEmpty()) {
//       _putDemoData();
//     }
//   }

//   static Future<NewProductController> create() async {
//     final store = await openStore();
//     return NewProductController._create(store);
//   }

//   void _putDemoData() {
//     final demoNotes = [
//       ProductModel(
//         nomeProduto: 'Quickly add a note by writing text and pressing Enter',
//         image: 'https:',
//         date: DateTime.now(),
//       ),
//     ];
//     store.runInTransactionAsync(TxMode.write, _putNotesInTx, demoNotes);
//   }

//   Stream<List<ProductModel>> getNotes() {
//     final builder =
//         produtoBox.query().order(ProductModel_.date, flags: Order.descending);

//     return builder.watch(triggerImmediately: true).map((query) => query.find());
//   }

//   static void _putNotesInTx(Store store, List<ProductModel> notes) =>
//       store.box<ProductModel>().putMany(notes);

//   Future<void> addNote(ProductModel produto) =>
//       store.runInTransactionAsync(TxMode.write, _addNoteInTx, produto);

//   static void _addNoteInTx(Store store, ProductModel produto) {
//     store.box<ProductModel>().put(
//         ProductModel(nomeProduto: produto.nomeProduto, image: produto.image));
//   }
}



// import 'package:padaria_panq/app/database/objectbox/models/product-model.dart';
// import 'package:padaria_panq/app/database/objectbox/objectbox_generation/objectbox.g.dart';

// /// Provides access to the ObjectBox Store throughout the app.
// ///
// /// Create this in the apps main function.
// class ObjectBox {
//   /// The Store of this app.
//   late final Store store;

//   /// A Box of notes.
//   late final Box<ProductModel> produtoBox;

//   ObjectBox._create(this.store) {
//     produtoBox = Box<ProductModel>(store);

//     // Add some demo data if the box is empty.
//     if (produtoBox.isEmpty()) {
//       _putDemoData();
//     }
//   }

//   /// Create an instance of ObjectBox to use throughout the app.
//   static Future<ObjectBox> create() async {
//     // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
//     final store = await openStore();
//     return ObjectBox._create(store);
//   }

//   void _putDemoData() {
//     final demoNotes = [
//       ProductModel(
//         nomeProduto: 'Quickly add a note by writing text and pressing Enter',
//         image: 'https://pubimg.band.uol.com.br/files/91cfe899a8842aec1cc7.png',
//         date: DateTime.now(),
//       ),
//     ];
//     store.runInTransactionAsync(TxMode.write, _putNotesInTx, demoNotes);
//   }

//   Stream<List<ProductModel>> getNotes() {
//     // Query for all notes, sorted by their date.
//     // https://docs.objectbox.io/queries
//     final builder =
//         produtoBox.query().order(ProductModel_.date, flags: Order.descending);
//     // Build and watch the query,
//     // set triggerImmediately to emit the query immediately on listen.
//     return builder
//         .watch(triggerImmediately: true)
//         // Map it to a list of notes to be used by a StreamBuilder.
//         .map((query) => query.find());
//   }

//   static void _putNotesInTx(Store store, List<ProductModel> notes) =>
//       store.box<ProductModel>().putMany(notes);

//   /// Add a note within a transaction.
//   ///
//   /// To avoid frame drops, run ObjectBox operations that take longer than a
//   /// few milliseconds, e.g. putting many objects, in an isolate with its
//   /// own Store instance.
//   /// For this example only a single object is put which would also be fine if
//   /// done here directly.
//   Future<void> addNote(ProductModel produto) =>
//       store.runInTransactionAsync(TxMode.write, _addNoteInTx, produto);

//   /// Note: due to [dart-lang/sdk#36983](https://github.com/dart-lang/sdk/issues/36983)
//   /// not using a closure as it may capture more objects than expected.
//   /// These might not be send-able to an isolate. See Store.runAsync for details.
//   static void _addNoteInTx(Store store, ProductModel produto) {
//     // Perform ObjectBox operations that take longer than a few milliseconds
//     // here. To keep it simple, this example just puts a single object.
//     store.box<ProductModel>().put(
//         ProductModel(nomeProduto: produto.nomeProduto, image: produto.image));
//   }
// }
