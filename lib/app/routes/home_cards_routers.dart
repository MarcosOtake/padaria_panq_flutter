import 'package:get/get.dart';
import 'package:padaria_panq/app/modules/home_list_cards/home_list_cards/home_list_cards_page.dart';
import 'package:padaria_panq/app/routes/routers.dart';

class HomeCardsRouters {
  HomeCardsRouters._();
  static final homeCards = GetPage(
    name: Routers.homeCards,
    page: () => const HomeListCardsPage(),
  );
}
