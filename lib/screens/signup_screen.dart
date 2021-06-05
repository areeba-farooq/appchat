import 'package:appchat/Widgets/bottomText_widget.dart';
import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/Widgets/inputField_widget.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Signup extends StatefulWidget {
static String id = 'signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'logo',
            child: Container(
              height: 300.0,
              child: Image.asset('images/appchat.png'),
            ),
          ),
          SizedBox(height: 40.0,),
          InputField(border: border, title: 'Enter User Name', onChange: (value){}),

          SizedBox(height: 20.0,),
          InputField(border: border, title: 'Enter your Email', onChange: (value){}),

          SizedBox(height: 20.0,),
          InputField(border: border, title: 'Enter your password', onChange: (value){}),

          SizedBox(height: 24.0,),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Buttons(color: Theme.of(context).primaryColor, title: 'SignUp', style: kLoginSignup,
              onPress: (){
                Navigator.pushNamed(context, HomePage.id);
              },)
          ),
          SizedBox(height: 30.0,),
          BottomText(title: 'Already have an account?',
              onPress: (){Navigator.pushNamed(context, LoginPage.id);}, text: 'Login')
        ],
      ),
    );
  }
}
