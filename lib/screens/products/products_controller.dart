import 'package:get/get.dart';
import 'dart:math';
import 'package:get_grapql_master/api/api_error.dart';
import 'package:get_grapql_master/api/products/product_repository.dart';
import 'package:get_grapql_master/models/response/product_response.dart';
import 'package:get_grapql_master/shared/utils/app_log.dart';

class ProductsController extends GetxController with ApiError {
  ProductRepository productRepository;
  RxList<ProductResponse> products=<ProductResponse>[].obs;
  ProductsController({required this.productRepository});

  @override
  void onReady() {
    super.onReady();
    getProducts();
  }

  getProducts() async {
    await apiCallSafety<List<ProductResponse>>(
        () => productRepository.products(),
        onStart: () async {},
        onCompleted: (bool status, List<ProductResponse>? res) async {
          if(res!=null)
            {
              products.value=res;
            }
        },
        skipOnError: true, onError: (dynamic error) async {
      logger.d("error ", error);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  Future<int> onApiError(error) async {
    // TODO: implement onApiError
    return 1;
  }
}
