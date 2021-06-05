import 'package:appchat/screens/chat_screen.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:appchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppChat());

class AppChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF01B3B4),
        accentColor: Color(0xFF2A6971)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        Signup.id: (context) => Signup(),
        HomePage.id: (context) => HomePage(),
        ChatPage.id: (context) => ChatPage(),
      },
    );
  }
}
