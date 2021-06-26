import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/constants.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcome_page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1),
    vsync: this,
    );

    animation = ColorTween(begin:Colors.blueGrey, end: Colors.white).animate(controller);




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
        padding: EdgeInsets.symmetric(horizontal: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/appchat.png'),
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('App Chat',
                  speed: Duration(milliseconds: 100),
                  textStyle: TextStyle(
                  fontSize: 70.0,
                  color: Theme.of(context).accentColor,
                  fontFamily: 'Dancing Script',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0
              ),
                )]
              ),
            SizedBox(height: 40.0,),
            Buttons(title: 'Login', onPress: (){Navigator.pushNamed(context, LoginPage.id);},
              color: Theme.of(context).primaryColor, style:  kWelcomeButtons,),
            Buttons(color: Theme.of(context).accentColor, onPress: (){
              Navigator.pushNamed(context, Signup.id);
            }, title: 'Signup', style: kWelcomeButtons,),
          ],
        ),
      ),
    );
  }
}

