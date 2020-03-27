import 'package:flutter/material.dart';


class SearchResult extends StatelessWidget {

  static String id = "search_result";
  
  const SearchResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suchergebnisse"),
        backgroundColor: Colors.red,
      ),
    );
  }
}