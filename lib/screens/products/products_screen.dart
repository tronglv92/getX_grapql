import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_grapql_master/api/graphql_operation/queries/product_queries.dart';
import 'package:get_grapql_master/models/response/product_response.dart';

import 'package:get_grapql_master/screens/products/products_controller.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // logger.d("Render Home Screen");
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  const Text("Query Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Products',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: Obx(()=>GridView.builder(
                  itemCount: controller.products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2),
                  itemBuilder: (BuildContext buildContext, int index) {
                    ProductResponse product = controller.products[index];
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          width: 120,
                          height: 120,
                          child: Image.network(product.thumbNail?.url??''),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                      ],
                    );
                  })))

        ],
      ),
    );
  }
}
