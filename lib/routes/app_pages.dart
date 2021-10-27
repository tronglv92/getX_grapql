

import 'package:get/get.dart';
import 'package:get_grapql_master/screens/home/home_binding.dart';
import 'package:get_grapql_master/screens/home/home_screen.dart';
import 'package:get_grapql_master/screens/products/products_binding.dart';
import 'package:get_grapql_master/screens/products/products_screen.dart';
import 'package:get_grapql_master/screens/query/query_binding.dart';
import 'package:get_grapql_master/screens/query/query_screen.dart';
import 'package:get_grapql_master/screens/splash/splash_binding.dart';
import 'package:get_grapql_master/screens/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.QUERY,
      page: () =>  ProductsScreen(),
      binding: ProductsBinding(),
    ),
  ];
}