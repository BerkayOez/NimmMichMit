import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

class Zuginfo {
  final String von;
  final String nach;
  final String zugname;
  final String gleis;
  final TimeOfDay zeit;
  final DateTime datum;
  final String timeOutput;

  Zuginfo(this.von, this.nach, this.zugname, this.gleis, this.zeit, this.datum, this.timeOutput);
}

class NehmeDichMit extends StatelessWidget {
  const NehmeDichMit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nehme Dich Mit"),
        backgroundColor: Colors.red,
      ),
      body:SingleChildScrollView(
        child: NMDFormular()
      ),
    );
  }
}

String _zugname, _gleis, _start, _ziel;
DateTime _date = DateTime.now();
TimeOfDay _time = TimeOfDay.now();
String _timeOutput;
final _cntlZugname = TextEditingController();                     //Text Controller für die jeweiligen Variablen 
final _cntlGleis = TextEditingController();                       // Zugname, Gleisnr, Von:, Nach:
final _cntlStart = TextEditingController();
final _cntlZiel = TextEditingController();

class NMDFormular extends StatefulWidget {
  NMDFormular({Key key}) : super(key: key);

  @override
  _NMDFormularState createState() => _NMDFormularState();
}

class _NMDFormularState extends State<NMDFormular> {

  final format = DateFormat("HH:mm");

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = true}) {               //Zeit-Format, damit beim TimePicker 24h- 
    return alwaysUse24HourFormat                                                        //Version angezeigt wird.
      ? TimeOfDayFormat.HH_colon_mm
      : TimeOfDayFormat.HH_dot_mm;
  }

  @override
  void initState() { 
    super.initState();
    _cntlZugname.addListener(_addZugname);
    _cntlGleis.addListener(_addGleis);
    _cntlStart.addListener(_addStart);
    _cntlZiel.addListener(_addZiel);
  }

  _addZugname() {
   _zugname = _cntlZugname.text;
  }
  _addGleis() {
    _gleis = _cntlGleis.text;
  }
  _addStart() {
    _start = _cntlStart.text;
  }
  _addZiel() {
    _ziel = _cntlZiel.text;
  }

  void buttonClicked() {
    Zuginfo _zuginfo = new Zuginfo(
      _start, 
      _ziel, _zugname, 
      _gleis, _time, 
      _date, _timeOutput
     );

    Navigator.pushNamed(this.context, '/confirm_page', arguments: _zuginfo);
  }

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          StartTextField(),
          SizedBox(
            height: 30.0,
          ),
          ZielTextField(),
          SizedBox(
            height: 50.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ZugnameTextField(),
              GleisTextField(),
            ],
          ),

           SizedBox(
            height: 50.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DatePickerField(),
              TimePickerField(),
            ],
          ),

          SizedBox(
            height: 50.0,
          ),

         Container(
          width: double.infinity,
          child: FlatButton(
            onPressed: buttonClicked, 
            child: Text("Speichern"),
            color: Colors.red,
            textColor: Colors.white,
          ),
        ),

        ],
       ),
    );
  }
}

class StartTextField extends StatelessWidget {
  const StartTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("VON : ",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        Container(
          width: 330,
          height: 50.0,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.red,
            ),
              child: TextField(
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.0, top: 5.0),
                labelText: "z.B Essen Hbf",
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              controller: _cntlStart,
            ),
          ),
        ),
      ],
    );
  }
}


class ZielTextField extends StatelessWidget {
  const ZielTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("NACH : ",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        Container(
          width: 315,
          height: 50.0,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.red,
              accentColor: Colors.orange,
            ),
              child: TextField(
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                helperStyle: TextStyle(
                  color: Colors.red,
                ),
                contentPadding: EdgeInsets.only(left: 10.0, top: 5.0),
                labelText: "z.B Köln Hbf",
                labelStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              controller: _cntlZiel,
            ),
          ),
        ),
      ],
    );
  }
}

class ZugnameTextField extends StatelessWidget {
  const ZugnameTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Welcher Zug?",
          style: TextStyle(
            fontSize: 18.0
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60.0,
          width: 170.0,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.red,
            ),
            child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: "z.B RE42",
              labelStyle: TextStyle(
                fontSize: 15.0,
                fontStyle: FontStyle.italic,
              ),
              icon: Icon(Icons.train)
            ),
            controller: _cntlZugname,
            ),
          ),
        ),
      ],
    );
  }
}

class GleisTextField extends StatelessWidget {
  const GleisTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Welches Gleis?",
          style: TextStyle(
            fontSize: 18.0
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          height: 60.0,
          width: 170.0,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.red,
            ),
            child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: "z.B 3",
              labelStyle: TextStyle(
                fontSize: 15.0,
                fontStyle: FontStyle.italic
              ),
              icon: Icon(Icons.power_input)
            ),
            controller: _cntlGleis,
            ),
          ),
        ),
      ],
    );
  }
}

class DatePickerField extends StatefulWidget {
  DatePickerField({Key key}) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context, 
      initialDate: _date, 
      firstDate: DateTime(2019), 
      lastDate: DateTime(2023)
    );

    if (picked != null && picked != _date){
      print(_date.toString());

      setState(() {
        _date = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            selectDate(context);
          },
        ),
        Container(
          height: 50.0,
          width: 125,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.red,
            ),
            child: TextField(
              textAlign: TextAlign.start,
              readOnly: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: "${formatDate(_date, [dd, '/', mm, '/', yyyy])}"
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimePickerField extends StatefulWidget {
  const TimePickerField({Key key}) : super(key: key);

  @override
  _TimePickerFieldState createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context, 
      initialTime: _time,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );

    if (picked != null && picked != _time){
      setState(() {
        _time = picked;
        _timeOutput = picked.toString();
        _timeOutput = _timeOutput.substring(10,15);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.access_time), 
          onPressed: () {
            selectTime(context);
          }
        ),
        Container(
          height: 50.0,
          width: 125,
          child: Theme(
            data: ThemeData(
              primaryColor: Colors.red,
            ),
            child: TextField(
              textAlign: TextAlign.start,
              readOnly: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0
              ),
              decoration: InputDecoration(
              hintText: _timeOutput == null ? "Uhrzeit?":"$_timeOutput",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
