import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiProvider {
   GraphQLClient? _client;

  // static ValueNotifier<GraphQLClient> init() {
  //   final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");
  //   ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  //       link: httpLink, cache: GraphQLCache(store: InMemoryStore())));
  //   return client;
  // }

  GraphQLClient getClient() {
    if (_client != null) {
      return _client!;
    } else {
      final HttpLink _httpLink = HttpLink(
        'https://demo.saleor.io/graphql/',
      );

      final AuthLink _authLink = AuthLink(
        getToken: () => 'Bearer YOUR_PERSONAL_ACCESS_TOKEN',
      );

      final Link _link = _authLink.concat(_httpLink);

      _client = GraphQLClient(
        cache: GraphQLCache(
          store: HiveStore(),
        ),
        link: _link,
      );
      return _client!;
    }
  }
}
