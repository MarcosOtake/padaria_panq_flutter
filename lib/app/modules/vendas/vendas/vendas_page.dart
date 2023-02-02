import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './vendas_controller.dart';

class VendasPage extends GetView<VendasController> {
    
    const VendasPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('VendasPage'),),
            body: Container(),
        );
    }
}