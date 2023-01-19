import 'package:flutter/material.dart';

class PadariaAppBar extends AppBar {
  PadariaAppBar({Key? key, double elevation = 2})
      : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: elevation,
            centerTitle: true,
            // title: Image.asset(
            //   'assets/images/logo-pan_q.png',
            //   fit: BoxFit.cover,
            //   height: 50,
            //)
            title: const Text(
              'PAN_q',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black));
}
