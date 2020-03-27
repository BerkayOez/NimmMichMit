import 'package:flutter/material.dart';
import 'package:nmm/Konto/components/RoundedButton.dart';
import 'package:nmm/Konto/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nmm/Konto/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen'; 
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registrierung"),
        backgroundColor: Colors.red,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "Train-Logo",
                  child: Container(
                    height: 100.0,
                    child: Image.asset('lib/Konto/images/NMM-Train2.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                    print(email);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: "Email eingeben")
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: "Password eingeben")
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: "Registrieren",
                  colour: Colors.red,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser != null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    }
                    catch (e){
                      print(e);
                    }
                    
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
