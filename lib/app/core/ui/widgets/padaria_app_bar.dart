import 'package:flutter/material.dart';

class PadariaAppBar extends AppBar {
  PadariaAppBar({
    Key? key,
    String? title,
    double elevation = 2,
  }) : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: elevation,
            centerTitle: true,
            toolbarHeight: 100,
            // title: Image.asset(
            //   'assets/images/logo-pan_q.png',
            //   fit: BoxFit.cover,
            //   height: 50,
            //)
            title: Text(
              title ?? '',
              style: const TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black));
}
