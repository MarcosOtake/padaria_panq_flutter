import 'package:flutter/material.dart';

class CardsHome extends StatelessWidget {
  final double? width;
  final double? height;

  const CardsHome({Key? key, this.width = 80, this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white60,
          width: 3.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.black87,
        image: const DecorationImage(
          fit: BoxFit.fitHeight,
          opacity: 0.95,
          image: NetworkImage(
              'https://cdn.panelinha.com.br/receita/1464663600000-Pao-italiano-caseiro.jpg'),
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Novos Produtos',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
