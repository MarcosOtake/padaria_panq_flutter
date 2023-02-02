import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_text_form_field.dart';
import 'package:padaria_panq/app_teste/screens/new_product/new_product_controller.dart';
import 'package:padaria_panq/app_teste/screens/new_product/widget/product_image_page.dart';
import 'package:padaria_panq/app_teste/widgets/custom_app_bar.dart';
import 'package:validatorless/validatorless.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

// File? _imageSelect;
// final _imagePicker = ImagePicker();

final _controllerEC = TextEditingController().obs;
final _key = GlobalKey<FormState>();
// ProductModel? produto;
RxBool isLoading = false.obs;
final controllerNewProd = Get.put(NewProductController());
//final controllerNewProd = Get.find<NewProductController>();

class _NewProductScreenState extends State<NewProductScreen> {
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
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Novo produto',
                      style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),

                SizedBox(height: context.mediaQuerySize.height * 0.02),

                ProductImagePage(),
                const Text(
                  'Editar imagem',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: context.mediaQuerySize.height * 0.02),

                PadariaTextFormField(
                  controller: _controllerEC,
                  label: 'Nome produto',
                  validator: Validatorless.multiple([
                    Validatorless.required('Nome produto obrigatório'),
                  ]),
                ),

                SizedBox(height: context.mediaQuerySize.height * 0.02),

                SizedBox(height: context.mediaQuerySize.height * 0.02),

                const SizedBox(height: 40),
                PadariaButton(
                  onPressed: () {
                    controllerNewProd.saveBox(_controllerEC.value.text, 0,
                        controllerNewProd.productPicPath.value, DateTime.now());
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
    );
  }
}
