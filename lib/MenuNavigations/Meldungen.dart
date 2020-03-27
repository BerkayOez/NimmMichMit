import 'package:flutter/material.dart';

class Meldungen extends StatelessWidget {
  const Meldungen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meldungen"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

