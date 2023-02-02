import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padaria_panq/app_teste/screens/new_product/new_product_controller.dart';

class ProductImagePage extends GetView<NewProductController> {
  File? pickedFile;
  ImagePicker? imagePicker = ImagePicker();
  ProductImagePage({Key? key}) : super(key: key);

  //NewProductController newProductController = Get.put(NewProductController());
  var newProductController = Get.put(NewProductController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Obx(() {
          return InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: newProductController.isProductImagePath.value
                          ? FileImage(
                              File(newProductController.productPicPath.value))
                          : const AssetImage('assets/images/logo-pan_q.png')
                              as ImageProvider),
                ),
              ),
            ),
            onTap: () {
              showBottomSheet(
                enableDrag: true,
                context: context,
                builder: (context) {
                  return bottomSheetImage(context);
                },
              );
            },
          );
        }),
        // Positioned(
        //   bottom: 2,
        //   right: -1,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Icon(
        //         Icons.add_a_photo,
        //         color: Colors.blue,
        //         size: 24,
        //         semanticLabel: 'Add Foto',
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget bottomSheetImage(BuildContext contex) {
    Size size = MediaQuery.of(contex).size;
    return Container(
      height: size.height * 0.225,
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.005),
          Padding(
            padding: EdgeInsets.only(
                top: 8.0,
                left: size.width * 0.4,
                right: size.width * 0.4,
                bottom: size.width * 0.07),
            child: const Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        debugPrint('FOTO');
                        takePhoto(ImageSource.camera);
                        Get.back();
                      },
                      child: const Icon(
                        Icons.camera,
                        color: Colors.blueAccent,
                        size: 32,
                      )),
                  const Text(
                    'Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        debugPrint('ARQUIVO');
                        takePhoto(ImageSource.gallery);
                        Get.back();
                      },
                      child: const Icon(
                        Icons.image,
                        color: Color.fromARGB(255, 235, 215, 30),
                        size: 32,
                      )),
                  const Text(
                    'Arquivo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker?.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    newProductController.setProductImagePath(pickedFile!.path);
  }
}
