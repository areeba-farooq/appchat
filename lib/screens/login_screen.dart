import 'package:appchat/Widgets/bottomText_widget.dart';
import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/Widgets/inputField_widget.dart';
import 'package:appchat/constants.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

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
          InputField(border: border, title: 'Enter your email', onChange: (value){},),

          SizedBox(height: 20.0,),
          InputField(border: border, title: 'Enter your password', onChange: (value){}),

          SizedBox(height: 24.0,),
          Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Buttons(color: Theme.of(context).primaryColor, title: 'Login', style: kLoginSignup,
                onPress: (){
                Navigator.pushNamed(context, HomePage.id);
                },)
          ),

          SizedBox(height: 30.0,),
          BottomText(title: "Don't have an account?",
            onPress: (){Navigator.pushNamed(context, Signup.id);}, text: 'SignUp',)
        ],
      ),
    );
  }
}




