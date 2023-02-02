// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padaria_panq/app/core/ui/widgets/padaria_button.dart';
import 'package:padaria_panq/app_teste/config/palette.dart';
import 'package:padaria_panq/app_teste/screens/home/home_controller.dart';
import 'package:padaria_panq/app_teste/shared_widgets/cards_home.dart';
import 'package:padaria_panq/app_teste/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final String _country = 'USA';
  var listCards = <Widget>[
    const Padding(
      padding: EdgeInsets.all(4.0),
      child: CardsHome(),
    ),
    const Padding(
      padding: EdgeInsets.all(4.0),
      child: CardsHome(),
    ),
    const Padding(
      padding: EdgeInsets.all(4.0),
      child: CardsHome(),
    ),
    const Padding(
      padding: EdgeInsets.all(4.0),
      child: CardsHome(),
    ),
  ];
  final nameControllerEC = TextEditingController().obs;
  File? _imageSelect;
  final _imagePicker = ImagePicker().obs;
  final controller = Get.lazyPut(() => HomeController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          // physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: screenHeight * 0.03),
            // _buildHeader(screenHeight),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [..._buildCards()],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            PadariaButton(
              color: Colors.blue,
              label: 'Adicionar novo',
              onPressed: () {
                Get.toNamed('new-product');
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double screenHeight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/logo-pan_q.png',
                  width: 100,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'PAN_q',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Fermentação Natural',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const Center(
                    child: Text(
                      'Que tal fazer sua encomenda agora?',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  // SizedBox(height: screenHeight * 0.03),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     FlatButton.icon(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 10.0,
                  //         horizontal: 20.0,
                  //       ),
                  //       onPressed: () {},
                  //       color: Colors.red,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       icon: const Icon(
                  //         Icons.phone,
                  //         color: Colors.white,
                  //       ),
                  //       label: const Text(
                  //         'Ligue Já',
                  //         style: Styles.buttonTextStyle,
                  //       ),
                  //       textColor: Colors.white,
                  //     ),
                  //     const Text('ou',
                  //         style: TextStyle(fontSize: 18, color: Colors.white)),
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(30),
                  //       child: Container(
                  //         padding: const EdgeInsets.symmetric(
                  //           vertical: 10.0,
                  //           horizontal: 10.0,
                  //         ),
                  //         decoration: const BoxDecoration(color: Colors.blue),
                  //         child: Row(
                  //           children: [
                  //             const Text('Chame no ',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.w500)),
                  //             Image.asset(
                  //               'assets/images/whatsapp.png',
                  //               scale: 4.5,
                  //               fit: BoxFit.fill,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    var listCardsConstruction = <Widget>[];
    for (var card in listCards) {
      listCardsConstruction.add(card);
    }
    return listCardsConstruction;
  }

  Widget _buildYourOwnTest(double screenHeight) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.all(10.0),
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 1, 1),
            Color.fromARGB(255, 18, 17, 17),
            Color.fromARGB(255, 53, 39, 114),
            Color.fromARGB(255, 32, 4, 158),
          ],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            'assets/images/logo-pan_q.png',
            scale: 6.5,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Faça nos uma visita!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                'Rua não sei preciso pegar\ncom o gordo\n nº S/N',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
                maxLines: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
