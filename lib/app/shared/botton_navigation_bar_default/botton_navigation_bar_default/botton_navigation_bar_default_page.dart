import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padaria_panq/app/core/ui/padaria_ui_theme.dart';
import 'package:padaria_panq/app/modules/add_produto/add_produto_page.dart';
import 'package:padaria_panq/app/modules/home_list_cards/home_list_cards/home_list_cards_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottonNavigationBarDefaultPage extends StatefulWidget {
  const BottonNavigationBarDefaultPage({Key? key}) : super(key: key);

  @override
  State<BottonNavigationBarDefaultPage> createState() =>
      _BottonNavigationBarDefaultPageState();
}

class _BottonNavigationBarDefaultPageState
    extends State<BottonNavigationBarDefaultPage> {
  final controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PersistentTabView(
        context,
        navBarStyle: NavBarStyle.style6,
        backgroundColor: Colors.black38,
        screens: _buildScreen(),
        items: _navBarItem(),
      );
    });
  }

  List<Widget> _buildScreen() {
    return [
      const HomeListCardsPage(),
      const Center(child: Text('Vendas')),
      const AddProdutoPage(),
      const Center(child: Text('Ajustes')),
    ].obs;
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: PadariaUiTheme.theme.primaryColor,
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(
            Icons.home,
            color: Colors.grey,
          ),
          title: 'Inicio'),
      PersistentBottomNavBarItem(
          activeColorPrimary: PadariaUiTheme.theme.primaryColor,
          icon: const Icon(Icons.shopping_cart),
          inactiveIcon: const Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
          title: 'Vendas'),
      PersistentBottomNavBarItem(
          activeColorPrimary: PadariaUiTheme.theme.primaryColor,
          icon: const Icon(Icons.camera_enhance),
          inactiveIcon: const Icon(
            Icons.camera_enhance,
            color: Colors.grey,
          ),
          title: 'Produtos'),
      PersistentBottomNavBarItem(
          activeColorPrimary: PadariaUiTheme.theme.primaryColor,
          icon: const Icon(Icons.settings),
          inactiveIcon: const Icon(
            Icons.settings,
            color: Colors.grey,
          ),
          title: 'Ajustes'),
    ];
  }
}
