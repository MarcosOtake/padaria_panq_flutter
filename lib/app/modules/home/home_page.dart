import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Produtos'),
        backgroundColor: Colors.black54,
      ),
      body: Obx(
        () {
          var listaProdutos = controller.insertProducts();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: controller.listProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (_, int index) {
                return InkWell(
                  onTap: () {},
                  onLongPress: () {},
                  child: GridTile(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(16)),
                            child: Image.network(
                              listaProdutos.value[index].image.toString(),
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.black87.withOpacity(0.81)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(listaProdutos.value[index].nameProduct,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center),
                                    const Text('PAN_Q',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.start),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );

    //     ListView.builder(
    //   itemCount: listImages.length,
    //   itemBuilder: (context, index) {
    //     return Row(
    //       children: [
    //         Card(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(16)),
    //           child: Image.network(
    //             listImages[index],
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // ),
    // ));
  }
}
