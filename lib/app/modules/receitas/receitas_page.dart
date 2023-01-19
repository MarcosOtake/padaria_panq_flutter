import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './receitas_controller.dart';

class ReceitasPage extends GetView<ReceitasController> {
    
    const ReceitasPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ReceitasPage'),),
            body: Container(),
        );
    }
}