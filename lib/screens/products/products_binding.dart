import 'package:get/get.dart';
import 'package:get_grapql_master/screens/products/products_controller.dart';




class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(
           ProductsController(productRepository: Get.find()));
  }
}