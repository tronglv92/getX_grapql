import 'package:get_grapql_master/api/products/product_api.dart';
import 'package:get_grapql_master/models/response/error_response.dart';
import 'package:get_grapql_master/models/response/product_response.dart';
import 'package:get_grapql_master/shared/utils/app_log.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductRepository{
  ProductApi productApi;
  ProductRepository({required this.productApi});

  Future<List<ProductResponse>> products() async {
    QueryResult queryResults=await productApi.products();
    if(queryResults.hasException)
      {
        throw ErrorResponse(message: queryResults.exception?.graphqlErrors[0].message);
     
      }
    else
      {
        final List<dynamic> products =
        queryResults.data!['products']['edges']as List<dynamic>;

        final List<ProductResponse> listOfProducts = products
            .map((dynamic e) {
          logger.d("listOfProducts item  ",e);
              return ProductResponse.fromJson(e);
        })
            .toList();
        logger.d("listOfProducts.length ",listOfProducts.length);
        return listOfProducts;
      }
  }
}