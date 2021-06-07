import 'package:chatting_app/login_screen.dart';
import 'package:chatting_app/register_screen.dart';
import 'Rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Hero(
              tag: 'logo',
              child: Container(
                height: 80.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: TypewriterAnimatedTextKit(
              text: ['FLASH CHAT'],
              textStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.0),
            child: SizedBox(
              height: 50.0,
              //width: 250.0,
              child: Divider(
                color: Color(0xffBDBDBD),
              ),
            ),
          ),
          RoundedButtons(
            onpressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            title: 'Log In',
            colour: Color(0xff009688),
          ),
          RoundedButtons(
            onpressed: () {
              Navigator.pushNamed(context, RegisterScreen.id);
            },
            title: 'Register',
            colour: Colors.teal[800],
          ),
        ],
      ),
    );
  }
}
