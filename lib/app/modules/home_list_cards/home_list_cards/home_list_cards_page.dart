import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:padaria_panq/app/shared/cards_home.dart';
import './home_list_cards_controller.dart';

class HomeListCardsPage extends GetView<HomeListCardsController> {
  const HomeListCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            opacity: 0.25,
            image: NetworkImage(
                'https://cdn.panelinha.com.br/receita/1464663600000-Pao-italiano-caseiro.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo-pan_q.png',
                        colorBlendMode: BlendMode.darken,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Pan_q',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Pães Diversos',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          SizedBox(width: 8),
                          CardsHome(
                            height: 160,
                            width: 160,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Column(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Lanches Preparados',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Column(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Bebidas Quentes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Column(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Bebidas Geladas',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(width: 12),
                          CardsHome(
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
