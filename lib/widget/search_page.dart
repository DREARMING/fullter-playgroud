import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("结果1"),
        Text("结果1"),
        Text("结果1"),
        Text("结果1"),
        Text("结果1"),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Text("输入内容搜索");
}
