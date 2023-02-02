// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:padaria_panq/app/database/objectbox/models/product-model.dart';

// import '../../database/objectbox/objectbox_generation/objectbox.g.dart';

// class NewProduct extends StatefulWidget {
//   const NewProduct({Key? key}) : super(key: key);

//   @override
//   State<NewProduct> createState() => _NewProductState();
// }

// class _NewProductState extends State<NewProduct> {
//   late final Box<ProductModel> produtoBox;

//   final _noteInputController = TextEditingController().obs;

//   final _imageInputController = TextEditingController().obs;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//       late final Box<ProductModel> produtoBox;
//     });
//   }

//   Future save(ProductModel productModel) async {
//     produtoBox.put(productModel);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PRODUTO'),
//       ),
//       body: Column(children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: TextField(
//                         decoration: const InputDecoration(
//                             hintText: 'Insira um novo produto'),
//                         controller: _noteInputController.value,

//                         // Provide a Key for the integration test
//                         key: const Key('input'),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: TextField(
//                         decoration: const InputDecoration(
//                             hintText: 'Insira uma novo imagem'),
//                         controller: _imageInputController.value,

//                         // Provide a Key for the integration test
//                         key: const Key('input'),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 10.0, right: 10.0),
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'Tap a note to remove it',
//                           style: TextStyle(
//                             fontSize: 11.0,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ]),
//       // We need a separate submit button because flutter_driver integration
//       // test doesn't support submitting a TextField using "enter" key.
//       // See https://github.com/flutter/flutter/issues/9383
//       floatingActionButton: FloatingActionButton(
//         key: const Key('submit'),
//         onPressed: () {
//           save(
//             ProductModel(
//               nomeProduto: _noteInputController.value.text,
//               image: _imageInputController.value.text,
//               date: DateTime.now(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_app_bar.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_text_form_field.dart';
import 'package:padaria_panq/app/database/objectbox/models/product-model.dart';
import 'package:padaria_panq/app/routes/routers.dart';

import 'package:validatorless/validatorless.dart';
import 'package:image_picker/image_picker.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

File? _imageSelect;
final _imagePicker = ImagePicker();
final _controllerEC = TextEditingController().obs;
final _key = GlobalKey<FormState>();
ProductModel? produto;
RxBool isLoading = false.obs;

class _NewProductState extends State<NewProduct> {
//  var controllerNovoProduto = Get.find<NewProductController>();

  @override
  void dispose() {
    _controllerEC.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var params = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PadariaAppBar(
        elevation: 0,
      ),
      body: Obx(() {
        return isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cadastrar novo produto',
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        const SizedBox(height: 8),
                        PadariaTextFormField(
                          controller: _controllerEC,
                          label: 'Nome produto',
                          validator: Validatorless.multiple([
                            Validatorless.required('Nome produto obrigatório'),
                          ]),
                        ),

                        SizedBox(height: context.mediaQuerySize.height * 0.02),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Selecione como deseja inserir a imagem.',
                                  style: context.textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
                                  ),
                                )),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              selecionarImagemCamera();
                                            },
                                            child: const Icon(
                                              Icons.photo_camera,
                                              color: Colors.blueGrey,
                                            )),
                                        Text(
                                          'Foto',
                                          style: context.textTheme.bodyText2
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                context.theme.primaryColorDark,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              selecionarImagemGaleria();
                                            },
                                            child: const Icon(
                                              Icons.folder,
                                              color: Color.fromARGB(
                                                  255, 201, 181, 2),
                                            )),
                                        Text(
                                          'Arquivo',
                                          style: context.textTheme.bodyText2
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                context.theme.primaryColorDark,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: context.mediaQuerySize.height * 0.02),
                        _imageSelect == null
                            ? SizedBox(
                                width: context.mediaQuerySize.width * 0.75,
                                height: context.mediaQuerySize.height * 0.25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: AspectRatio(
                                    aspectRatio: 2.5,
                                    child: Container(
                                      color: Colors.grey[200],
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.image),
                                          Text('Nenhuma imagem')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: context.mediaQuerySize.width * 0.75,
                                height: context.mediaQuerySize.height * 0.25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: AspectRatio(
                                    aspectRatio: 2.5,
                                    child: Image.file(
                                      File(_imageSelect!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                        const SizedBox(height: 40),
                        PadariaButton(
                          onPressed: () {
                            save(_controllerEC);
                          },
                          label: 'CADASTRAR',
                          width: context.width,
                        ),
                        // const SizedBox(height: 60)
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  save(Rx<TextEditingController> controller) async {
    var validate = _key.currentState?.validate() ?? false;
    _imageSelect = null;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    await Get.offAndToNamed(Routers.navigationBar);
    isLoading.value = false;
    // if (validate && _imageSelect != null) {
    //   controllerNovoProduto?.saveProd(
    //      produto(
    //       id: produto?.id ?? 1,
    //       nome: _controllerEC.value.text,
    //       image: _imageSelect!.path.toString(),
    //     ),
    //   );
    //   _imageSelect = null;
    //   Get.back();
    // } else {
    //   Get.showSnackbar(const GetSnackBar(
    //     duration: Duration(seconds: 5),
    //     borderRadius: 30,
    //     margin: EdgeInsets.all(16),
    //     title: 'Erro ao salvar seu produto',
    //     message: 'Favor verifique se preencheu todos os dados',
    //     backgroundColor: Colors.redAccent,
    //   ));
    // }
  }

  selecionarImagemCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imageSelect = File(image.path);
        print(_imageSelect.runtimeType);
      });
    }
  }

  selecionarImagemGaleria() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageSelect = File(image.path);
      });
    }
  }
}



//Dicas de carregamento de imagens 
//https://api.flutter.dev/flutter/widgets/Image/loadingBuilder.html