import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:padaria_panq/app/core/ui/padaria_ui_theme.dart';
import 'package:padaria_panq/app_teste/routers/home_routers.dart';
import 'package:padaria_panq/app_teste/routers/nav_botton.dart';
import 'package:padaria_panq/app_teste/routers/new_product.dart';
// import 'package:padaria_panq/app/modules/criar_produtos_receitas/new_product_bindings.dart';
// import 'package:padaria_panq/app/routes/add_product_routers.dart';
// import 'package:padaria_panq/app/routes/auth_routers.dart';
// import 'package:padaria_panq/app/routes/home_cards_routers.dart';
// import 'package:padaria_panq/app/routes/home_routers.dart';
// import 'package:padaria_panq/app/routes/navigation_bar_routers.dart';
// import 'package:padaria_panq/app/routes/novo_produto_routers.dart';
// import 'package:padaria_panq/app/routes/register_routers.dart';
// import 'package:padaria_panq/app/routes/splash_routers.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const PadariaPanQ());
}

class PadariaPanQ extends StatelessWidget {
  const PadariaPanQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Padaria PanQ',
      theme: PadariaUiTheme.theme,
      getPages: [
        HomeRouters.homePage,
        NavBotton.navbottom,
        NewProduct.newProduct,

        // NovoProdutoRouters.novoProduto,
        // ...SplashRouters.routers,
        // ...AuthRouters.loginPage,
        // ...HomeRouters.homePage,
        // HomeCardsRouters.homeCards,
        // NavigationBarRouters.navigationBar,
        // RegisterRouters.register,
        // AddProductRouters.addproduct,
      ],
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:padaria_panq/app/database/objectbox/models/product-model.dart';

// import 'app/database/objectbox/objectbox.dart';

// ignore_for_file: public_member_api_docs

/// Provides access to the ObjectBox Store throughout the app.
// late ObjectBox objectbox;

// Future<void> main() async {
//   // This is required so ObjectBox can get the application directory
//   // to store the database in.
//   WidgetsFlutterBinding.ensureInitialized();

//   objectbox = await ObjectBox.create();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         title: 'OB Example',
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: const MyHomePage(title: 'OB Example'),
//       );
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _noteInputController = TextEditingController();
//   final _imageInputController = TextEditingController();

//   Future<void> _addNote() async {
//     if (_noteInputController.text.isEmpty ||
//         _imageInputController.text.isEmpty) {
//       return;
//     }

//     await objectbox.addNote(ProductModel(
//         nomeProduto: _noteInputController.text,
//         image: _imageInputController.text));
//     _noteInputController.text = '';
//   }

//   @override
//   void dispose() {
//     _noteInputController.dispose();
//     super.dispose();
//   }

//   GestureDetector Function(BuildContext, int) _itemBuilder(
//           List<ProductModel> produtos) =>
//       (BuildContext context, int index) => GestureDetector(
//             onTap: () => objectbox.produtoBox.remove(produtos[index].id ?? 0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         border:
//                             Border(bottom: BorderSide(color: Colors.black12))),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 18.0, horizontal: 10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             produtos[index].nomeProduto ?? '',
//                             style: const TextStyle(
//                               fontSize: 15.0,
//                             ),

//                             // Provide a Key for the integration test
//                             key: Key('list_item_$index'),
//                           ),
//                           Image.network(produtos[index].image ?? ''),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 5.0),
//                             child: Text(
//                               'Added on ${produtos[index].dateFormat}',
//                               style: const TextStyle(
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: TextField(
//                           decoration: const InputDecoration(
//                               hintText: 'Insira um novo produto'),
//                           controller: _noteInputController,
//                           onSubmitted: (value) => _addNote(),
//                           // Provide a Key for the integration test
//                           key: const Key('input'),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: TextField(
//                           decoration: const InputDecoration(
//                               hintText: 'Insira uma novo imagem'),
//                           controller: _imageInputController,
//                           onSubmitted: (value) => _addNote(),
//                           // Provide a Key for the integration test
//                           key: const Key('input'),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(top: 10.0, right: 10.0),
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text(
//                             'Tap a note to remove it',
//                             style: TextStyle(
//                               fontSize: 11.0,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//               child: StreamBuilder<List<ProductModel>>(
//                   stream: objectbox.getNotes(),
//                   builder: (context, snapshot) => ListView.builder(
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       itemCount: snapshot.hasData ? snapshot.data!.length : 0,
//                       itemBuilder: _itemBuilder(snapshot.data ?? []))))
//         ]),
//         // We need a separate submit button because flutter_driver integration
//         // test doesn't support submitting a TextField using "enter" key.
//         // See https://github.com/flutter/flutter/issues/9383
//         floatingActionButton: FloatingActionButton(
//           key: const Key('submit'),
//           onPressed: _addNote,
//           child: const Icon(Icons.add),
//         ),
//       );
// }
