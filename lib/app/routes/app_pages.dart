import 'package:get/get.dart';
import 'package:zestypantry/app/modules/home/views/searchItemsListPage.dart';

import '../modules/Cart/bindings/cart_binding.dart';
import '../modules/Cart/views/cart_view.dart';
import '../modules/Order/bindings/order_binding.dart';
import '../modules/Order/views/order_view.dart';
import '../modules/Requests/bindings/requests_binding.dart';
import '../modules/Requests/views/requests_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/foods_home/bindings/foods_home_binding.dart';
import '../modules/foods_home/views/foods_home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/item/bindings/item_binding.dart';
import '../modules/item/views/item_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mainmenu/bindings/mainmenu_binding.dart';
import '../modules/mainmenu/views/mainmenu_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => SearchItemsListPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ITEM,
      page: () => ItemView(),
      binding: ItemBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTS,
      page: () => RequestsView(),
      binding: RequestsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.MAINMENU,
      page: () => const MainmenuView(),
      binding: MainmenuBinding(),
    ),
    GetPage(
      name: _Paths.FOODS_HOME,
      page: () => const FoodsHomeView(),
      binding: FoodsHomeBinding(),
    ),
  ];
}
