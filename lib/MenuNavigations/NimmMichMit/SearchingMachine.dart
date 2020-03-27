import 'package:flutter/material.dart';
import 'StartSelection.dart';
import 'dart:async';
import 'TargetSelection.dart';

var start = "VON";
var ziel = "NACH";
bool databack = false;
var sizeStart = 50.0;
Color textColorStart = Colors.black;
var sizeZiel = 50.0;
Color textColorZiel = Colors.black;

class SearchingMachine extends StatefulWidget {
  static String id = 'searching_machine';
  SearchingMachine({Key key}) : super(key: key);

  @override
  _SearchingMachineState createState() => _SearchingMachineState();
}

class _SearchingMachineState extends State<SearchingMachine> {

  List items = List<ListItem>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Stack(
             children: [

              Positioned(
                child: CircleAvatar(
                  radius: 130.0,
                  backgroundColor: Colors.red,
                ),
              ),

              Positioned(
                top: 2.0,
                left: 2.0,
                child: CircleAvatar(
                  radius: 128.0,
                  backgroundColor: Colors.white,
                ),
              ),

              Positioned(
                left: 30.0,
                top: 65.0,
                child: Start(),
              ),

              Positioned(
                top: 0.0,
                left: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  width: 260.0,
                  height: 260.0,
                  child: sizedBox(),
                ),
              ),

              Positioned(
                left: 30.0,
                top: 135.0,
                child: Ziel(),
              ),

              Positioned(
                top: 103.0,
                child: IconButton(
                  color: Colors.red,
                  iconSize: 30.0,
                  icon: Icon(Icons.import_export), 
                  onPressed: (){
                    if(databack == true){
                      setState(() {
                        var tmp = start;
                        start = ziel;
                        ziel = tmp;
                      });
                    }
                  }
                ),
              ),

              Positioned(
                top: 103.0,
                right: 1.0,
                child: IconButton(
                  color: Colors.red,
                  iconSize: 30.0,
                  icon: Icon(Icons.close), 
                  onPressed: (){
                    setState(() {
                      sizeStart = 50.0;
                      sizeZiel = 50.0;
                      start = "VON";
                      ziel = "NACH";
                      textColorStart = Colors.black;
                      textColorZiel = Colors.black;
                      databack = false;
                    });
                  }
                ),
              ),

              Positioned(
                bottom: 10.0,
                right: 100.0,
                child: IconButton(
                  color: Colors.red,
                  iconSize: 30.0,
                  icon: Icon(Icons.search), 
                  onPressed: () {
                    setState(() {
                      if(databack == true){
                        items.add(StartTargetItem("$start", "$ziel"));
                      } 
                    });
                  }
                ),
              ),
            ],
          ),
        ),
          Container(
            height: 350.0,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index){
                final item = items[index];
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          sizeStart = 20.0;
                          sizeZiel = 20.0;
                          textColorStart = Colors.red;
                          textColorZiel = Colors.red;
                          start = item.start1;
                          ziel = item.ziel1;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                      color: Colors.grey.shade100,
                      child: ListTile(
                      title: Text("Von: ${item.start1} "),
                      subtitle: Text("Nach: ${item.ziel1}"),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    )
                  ],
                );
              }
            ),
          ),
        ],
       ),
    );
  }
}

class sizedBox extends StatelessWidget {
  const sizedBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20.0,
        width: 170.0,
        child: Divider(
          thickness: 2.0,
          color: Colors.red.shade900,
        ),
    );
  }
}

abstract class ListItem {}

// A ListItem that contains data to display a message.
class StartTargetItem implements ListItem {
  final String start1;
  final String ziel1;

  StartTargetItem(this.start1, this.ziel1);
}


class Start extends StatefulWidget {
  Start({Key key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  Future _navigateStartSelection(BuildContext context) async {
    final _start = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StartSelection()),
    );
    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$_start")));
    
    if(_start != null){
      start = _start;
      databack = true;
    }else {
      databack = false;
      start = "Start auswählen!";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
        alignment: Alignment.center,
        width: 200.0,
        child: Center(
          child: FlatButton(
            onPressed: () async{
            await _navigateStartSelection(context);
              setState(() {
                databack = true;
                sizeStart = 20.0;
                textColorStart = Colors.red;
              });
            },
            child: Text(
              "$start", 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColorStart,
                fontSize: sizeStart,
                fontFamily: 'SourceSansPro',
              ),
            ),
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}


class Ziel extends StatefulWidget {
  Ziel({Key key}) : super(key: key);

  @override
  _ZielState createState() => _ZielState();
}

class _ZielState extends State<Ziel> {

  _navigateTargetSelection(BuildContext context) async {
    final _ziel = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TargetSelection()),
    );
    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$_ziel")));
    
    if(_ziel != null){
      ziel = _ziel;
      databack = true;
    }else {
      databack = false;
      ziel = "Ziel auswählen!";
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        width: 200.0,
        child: Center(
          child: FlatButton(
            onPressed: () async{
              await _navigateTargetSelection(context);
              setState(() {
                sizeZiel = 20.0;
                textColorZiel = Colors.red;
              });
            },
            child: Text(
              "$ziel", 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColorZiel,
                fontSize: sizeZiel,
                fontFamily: 'SourceSansPro',
              ),
            ),
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}