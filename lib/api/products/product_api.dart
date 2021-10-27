import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_grapql_master/api/api_provider.dart';
import 'package:gql/language.dart';
import 'package:graphql/client.dart';

import '../graphql_operation/queries/product_queries.dart';


class ProductApi {
  // final GraphQLClient client;
  final ApiProvider apiProvider;
  ProductApi({required this.apiProvider}) ;

  Future<QueryResult> products( ) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      document: parseString(productsGraphQL),
      variables: <String, dynamic>{
        // 'nRepositories': numOfRepositories,
      },
      pollInterval: const Duration(seconds: 4),
      fetchResults: true,
    );

    return await apiProvider.getClient().query(_options);
  }

  // Future<QueryResult> toggleRepoStar(Repo repo) async {
  //   var document =
  //   repo.viewerHasStarred ? mutations.removeStar : mutations.addStar;
  //
  //   final MutationOptions _options = MutationOptions(
  //     document: parseString(document),
  //     variables: <String, String>{
  //       'starrableId': repo.id,
  //     },
  //   );
  //
  //   return await client.mutate(_options);
  // }
}