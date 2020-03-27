import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nmm/Konto/screens/chat_interface.dart';
import 'package:nmm/Konto/screens/chat_screen.dart';
import 'package:nmm/MenuNavigations/Einstellungen.dart';
import 'package:nmm/MenuNavigations/Abfahrtsmonitor.dart';
import 'package:nmm/MenuNavigations/Kontakt.dart';
import 'package:nmm/MenuNavigations/KontoLogin.dart';
import 'package:nmm/MenuNavigations/Meldungen.dart';
import 'package:nmm/MenuNavigations/Mitteilungen.dart';
import 'package:nmm/MenuNavigations/NehmeDichMit/NehmeDichMit.dart';
import 'package:nmm/MenuNavigations/Netzplaene.dart';

final _auth = FirebaseAuth.instance;

void getUser() async{
    try{
      final user = await _auth.currentUser();
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch (e){
      print(e);
    }
  }


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Nimm Mich Mit'),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            leading: Icon(Icons.directions_railway),
            title: Text('Nimm Mich Mit'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text('Nehme Dich Mit'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NehmeDichMit()));
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('Abfahrtsmonitor'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Abfahrtsmonitor()));
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('Meldungen'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Meldungen()));
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Konto Login'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          widget(),
          greyLine(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Mitteilungen'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Mitteilungen()));
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.blur_linear),
            title: Text('Netzpläne'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Netzplaene()));
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Einstellungen'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Einstellungen()));
            },
          ),
          greyLine(),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Kontakt / Rechtliches'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kontakt()));
            },
          ),
        ],
      ),
    );
  }
}

class greyLine extends StatelessWidget {
  const greyLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.0,
      width: double.infinity,
      child: Divider(
        thickness: 1.0,
        color: Colors.grey,
      ),
    );
  }
}

class widget extends StatefulWidget {
  const widget({Key key}) : super(key: key);

  @override
  _widgetState createState() => _widgetState();
}

class _widgetState extends State<widget> {

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(loggedInUser != null){
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.chat),
          title: Text('Chats'),
          contentPadding: EdgeInsets.only(left: 50.0),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatInterfaceScreen()));
          },
        ),
        Container(
          color: Colors.red.shade200,
          child: ListTile(
            leading: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Icon(
                Icons.exit_to_app,
                textDirection: TextDirection.rtl,
              ),
            ),
            title: Text('Abmelden'),
            contentPadding: EdgeInsets.only(left: 50.0),
            onTap: () {
              print(loggedInUser);
              _auth.signOut();
              setState(() {
                loggedInUser = null;
              });
            },
          ),
        ),
      ],
    );
    }else {
      return Container();
    }
  }
}
