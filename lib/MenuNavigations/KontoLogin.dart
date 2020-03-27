import 'package:flutter/material.dart';
import 'package:nmm/Konto/screens/welcome_screen.dart';


class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(
      //  title: Text("Konto / Login"),
      //  backgroundColor: Colors.red,
      //),
      body: WelcomeScreen(),
    );
  }
}




