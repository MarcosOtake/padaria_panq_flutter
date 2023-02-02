import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/home/home_controller.dart';
import 'package:padaria_panq/app/modules/home_list_cards/home_list_cards/home_list_cards_page.dart';
import 'package:padaria_panq/app/shared/botton_navigation_bar_default/botton_navigation_bar_default/botton_navigation_bar_default_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottonNavigationBarDefaultPage(),
      body: HomeListCardsPage(),
    );
  }
}
