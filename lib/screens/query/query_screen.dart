import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_grapql_master/api/graphql_operation/queries/product_queries.dart';
import 'package:get_grapql_master/api/products/product_api.dart';
import 'package:get_grapql_master/lang/translation_service.dart';
import 'package:get_grapql_master/screens/query/query_controller.dart';
import 'package:get_grapql_master/shared/utils/app_extension.dart';
import 'package:get_grapql_master/shared/utils/app_style.dart';
import 'package:get_grapql_master/shared/widgets/a_button_rounded_long.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QueryScreen extends GetView<QueryController> {
  const QueryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // logger.d("Render Home Screen");
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  const Text("Query Screen"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(productsGraphQL),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final productList = result.data?['products']['edges'];
          print(productList);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Products',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2),
                      itemBuilder: (BuildContext buildContext, int index) {
                        var product = productList[index]['node'];
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              width: 120,
                              height: 120,
                              child: Image.network(product['thumbnail']['url']),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                product['name'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("\$4.5")
                          ],
                        );
                      }))
            ],
          );
        },
      ),
    );
  }
}
