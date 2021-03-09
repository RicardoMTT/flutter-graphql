import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://rickandmortyapi.com/graphql'),
  ),
);

final String getCharactersQuery = """
query{
  characters{
    results{
      id
      name
      image
    }
  }
}
""";
