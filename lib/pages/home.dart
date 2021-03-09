import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlflutter/api/api.dart';
import 'package:graphqlflutter/models/character.dart';
import 'package:graphqlflutter/pages/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options:
          QueryOptions(documentNode: gql(getCharactersQuery), pollInterval: 1),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        final List<Character> res = result.data['characters']['results']
            .map<Character>((c) => Character.fromJson(c))
            .toList();

        print(res);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('API rick and morty'),
          ),
          body: Center(
            child: result.hasException
                ? Text('ERror')
                : result.loading
                    ? CircularProgressIndicator()
                    : ListarPersonages(
                        list: res,
                        onRefresh: refetch,
                      ),
          ),
        );
      },
    );
  }

  Widget _askList(List<dynamic> list) {
    return Text(list.toString());
  }
}
