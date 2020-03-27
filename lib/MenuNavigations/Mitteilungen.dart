import 'package:flutter/material.dart';

class Mitteilungen extends StatelessWidget {
  const Mitteilungen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mitteilungen"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

