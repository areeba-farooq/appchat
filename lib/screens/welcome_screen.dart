import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/constants.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcome_page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text('App Chat', style: TextStyle(
              fontSize: 70.0,
              color: Theme.of(context).accentColor,
              fontFamily: 'Dancing Script',
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0
            ),),
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

