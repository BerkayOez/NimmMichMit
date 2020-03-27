import 'package:flutter/material.dart';
import 'package:nmm/Konto/screens/chat_screen.dart';
import 'package:nmm/LandingPage/SidebarMenu.dart';
import 'package:nmm/MenuNavigations/NimmMichMit/search_result.dart';
import 'Konto/screens/chat_interface.dart';
import 'Konto/screens/login_screen.dart';
import 'Konto/screens/registration_screen.dart';
import 'Konto/screens/welcome_screen.dart';
import 'MenuNavigations/NehmeDichMit/bestaetigung.dart';
import 'MenuNavigations/NimmMichMit/SearchingMachine.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.grey.shade300,
      accentColor: Colors.red,
      primarySwatch: Colors.red,
    ),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nimm Mich mit",
      home: MyHomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/confirm_page': (context) => Bestaetigung(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ChatInterfaceScreen.id: (context) => ChatInterfaceScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        SearchResult.id: (context) => SearchResult(),
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  static String id = 'myhomepage'; 
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Nimm Mich Mit"),
        backgroundColor: Colors.red,
      ),
      body: SearchingMachine(),
      drawer: MenuDrawer(),
    );
  }
}

