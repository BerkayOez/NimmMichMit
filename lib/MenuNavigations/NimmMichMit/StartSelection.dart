import 'package:flutter/material.dart';

class StartSelection extends StatefulWidget {

  @override
  _StartSelectionState createState() => _StartSelectionState();
}

class _StartSelectionState extends State<StartSelection> {
  final controllerStart = TextEditingController();

  String _start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Start'),
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
                        hintText: "Start eingeben",
                      ),

                      controller: controllerStart,
                      onEditingComplete: () {
                        _start = controllerStart.text;
                        Navigator.pop(context, _start);
                      },


                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.clear),
                    color: Colors.red, 
                    onPressed: () {
                      setState(() {
                        controllerStart.text = "";
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
