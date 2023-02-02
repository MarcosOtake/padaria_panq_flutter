import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_app_bar.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_text_form_field.dart';
import 'package:validatorless/validatorless.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

File? _imageSelect;
final _imagePicker = ImagePicker();
final _controllerEC = TextEditingController().obs;
final _key = GlobalKey<FormState>();

class _RegisterPageState extends State<RegisterPage> {
  @override
  void dispose() {
    _controllerEC.close();
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
      body: Padding(
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
                      'Cadastrar',
                      style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Text('${params ?? 'Não informado'}',
                    //     style: context.textTheme.headline6?.copyWith(
                    //       fontWeight: FontWeight.bold,
                    //       color: context.theme.primaryColorDark,
                    //     )),
                  ],
                ),
                const SizedBox(height: 8),

                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         ElevatedButton(
                //             onPressed: () {
                //               selecionarImagemCamera();
                //             },
                //             child: const Text('Tirar foto')),
                //         ElevatedButton(
                //             onPressed: () {
                //               selecionarImagemGaleria();
                //             },
                //             child: const Text('Imagem arquivo')),
                //       ],
                //     ),
                //   ],
                // ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  style: context.textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
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
                                      color: Color.fromARGB(255, 201, 181, 2),
                                    )),
                                Text(
                                  'Arquivo',
                                  style: context.textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
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
                    ? AspectRatio(
                        aspectRatio: 1.5,
                        child: Container(
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.image),
                              Text('Nenhuma imagem')
                            ],
                          ),
                        ),
                      )
                    : AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.file(
                          File(_imageSelect!.path),
                          fit: BoxFit.cover,
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
      ),
      // persistentFooterButtons: [
      //   PadariaButton(
      //     onPressed: () {},
      //     label: 'CADASTRAR',
      //     width: context.width,
      //   ),
      // ],
    );
  }

  save(Rx<TextEditingController> controller) {
    var validate = _key.currentState?.validate() ?? false;
    if (validate && _imageSelect != null) {
      Get.back();
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 5),
        borderRadius: 30,
        margin: const EdgeInsets.all(16),
        title: 'Produto salvo com sucesso',
        message: 'TESTE',
        backgroundColor: Colors.green.withOpacity(0.8),
      ));
      controller.value.clear();
      _imageSelect?.delete();
    } else {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 5),
        borderRadius: 30,
        margin: EdgeInsets.all(16),
        title: 'Erro ao salvar seu produto',
        message: 'Favor verifique se preencheu todos os dados',
        backgroundColor: Colors.redAccent,
      ));
    }
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
