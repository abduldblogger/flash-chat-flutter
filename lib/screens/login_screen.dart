import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_edit_text.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String email;
  String password;
  bool shouldShowLoader = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: shouldShowLoader,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: kHeroImgTag,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedEditText(
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your email',
                onTextChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedEditText(
                textInputType: TextInputType.text,
                obscureText: true,
                hintText: 'Enter your password',
                onTextChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                buttonText: 'Log In',
                onTap: () {
                  setState(() {
                    shouldShowLoader = true;
                  });
                  login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      final UserCredential user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      shouldShowLoader = false;
    });
  }
}
