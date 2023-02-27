import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String welcome = "/";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation =
        ColorTween(begin: Color.fromARGB(255, 30, 33, 34), end: Colors.white)
            .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                  child: AnimatedTextKit(
                    totalRepeatCount: 10,
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat',
                          speed: Duration(milliseconds: 300)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.registration);
                },
                text: "Register"),
            RoundedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.login);
                },
                text: "Log In",
                colour: Colors.lightBlueAccent)
          ],
        ),
      ),
    );
  }
}