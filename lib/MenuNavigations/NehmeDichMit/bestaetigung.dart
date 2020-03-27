import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'NehmeDichMit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = Firestore.instance;

class Bestaetigung extends StatelessWidget {

  Zuginfo zuginfo;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    zuginfo = settings.arguments;

    void sendToServer() {
      DateTime info = zuginfo.datum;
      TimeOfDay time = zuginfo.zeit;
      print(info.year);
      print(info.month);
      print(info.day);
      print(time.hour);
      print(time.minute);

      String formattedDateTime;
      if(info.month < 10){
        formattedDateTime = "${info.year}0${info.month}${info.day}T${time.hour}${time.minute}00";
        print(1);
        if(info.day < 10){
          formattedDateTime = "${info.year}0${info.month}0${info.day}T${time.hour}${time.minute}00";
          print(2);
        }
      }else if(info.day < 10){
        formattedDateTime = "${info.year}${info.month}0${info.day}T${time.hour}${time.minute}00";
        print(3);
      }else {
        formattedDateTime = "${info.year}${info.month}${info.day}T${time.hour}${time.minute}00";
        print(4);
      }

      DateTime dateTime = DateTime.parse(formattedDateTime);
      _firebase.collection('routes').add({
        'start': zuginfo.von,
        'ziel': zuginfo.nach,
        'zugname': zuginfo.zugname,
        'gleis': zuginfo.gleis,
        'anbieter': 'berkay.oz@mail.de',
        'DateTime': Timestamp.fromDate(dateTime)
      });
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Bestätigung"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InfoField(text: "Start", info: zuginfo.von,),
            InfoField(text: "Ziel", info: zuginfo.nach,),
            InfoField(text: "Zugname", info: zuginfo.zugname,),
            InfoField(text: "Gleis-Nummer", info: zuginfo.gleis,),
            InfoField(text: "Datum", info: formatDate(zuginfo.datum, [dd, '/', mm, '/', yyyy]),),
            InfoField(text: "Uhrzeit", info: zuginfo.timeOutput,),
            SizedBox(
              height: 50.0
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150.0,
                  child: FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    onPressed: (){}, 
                    child: Text("Zurück",)
                  ),
                ),
                Container(
                  width: 150.0,
                  child: FlatButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: sendToServer, 
                    child: Text("Bestätigen",)
                  ),
                ),
              ],
            ),
          ],
        ),
        
      ),
    );
  }
}

class InfoField extends StatelessWidget {
  final text;
  final info;
  const InfoField({Key key, this.text, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$text: ",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "$info",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontStyle: FontStyle.italic,
            ),
          ),
        ]
      ),
    );
  }
}