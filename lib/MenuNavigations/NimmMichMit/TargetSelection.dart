import 'package:flutter/material.dart';

class TargetSelection extends StatefulWidget {

  @override
  _TargetSelectionState createState() => _TargetSelectionState();
}

class _TargetSelectionState extends State<TargetSelection> {
  final controllerZiel = TextEditingController();

  var _ziel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Ziel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 300.0,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      hintText: "Ziel eingeben",
                    ),
                    controller: controllerZiel,
                    onEditingComplete: () {
                      _ziel = controllerZiel.text;
                      Navigator.pop(context, _ziel);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.red, 
                  onPressed: () {
                    setState(() {
                      controllerZiel.text = "";
                    });
                  },
                ),
              ],
            ),
          ),

          Divider(
            thickness: 2.0,
            height: 75.0,
          ),

        ],
      ),
    );
  }
}
