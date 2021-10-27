
import 'package:get/get.dart';
import 'package:get_grapql_master/api/api_provider.dart';
import 'package:get_grapql_master/api/products/product_api.dart';
import 'package:get_grapql_master/api/products/product_repository.dart';
import 'package:get_grapql_master/models/response/product_response.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {

    // Get.put(FirebaseAuthDatabase(),permanent: true);
    Get.put(ApiProvider(), permanent: true);
    Get.put(ProductApi(apiProvider: Get.find()), permanent: true);
    Get.put(ProductRepository(productApi: Get.find()), permanent: true);
  }
}