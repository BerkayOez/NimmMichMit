import 'package:flutter/material.dart';

class Einstellungen extends StatelessWidget {
  const Einstellungen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Einstellungen"),
        backgroundColor: Colors.red,
      ),
    );
  }
}