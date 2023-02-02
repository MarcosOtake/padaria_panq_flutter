import 'dart:io';

import 'package:flutter/material.dart';

class CardsHome extends StatelessWidget {
  final double? width;
  final double? height;
  final String? argument;
  final File? imageSelect;

  const CardsHome({
    Key? key,
    this.width = 150,
    this.height = 150,
    this.argument,
    this.imageSelect,
  }) : super(key: key);

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
          opacity: 0.5,
          image: NetworkImage(
              'https://cdn.panelinha.com.br/receita/1464663600000-Pao-italiano-caseiro.jpg'),
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Novos Produtos testes tamanho',
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
