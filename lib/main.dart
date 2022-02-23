import 'package:appchat/screens/chat_screen.dart';
import 'package:appchat/screens/friend_list_page.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/messages_screen.dart';
import 'package:appchat/screens/search_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:appchat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'models/msg_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppChat());}

class AppChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF01B3B4),
        accentColor: Color(0xFF2A6971)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SearchPage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        Signup.id: (context) => Signup(),
        HomePage.id: (context) => HomePage(),
        SearchPage.id: (context)=> SearchPage(),
         ChatPage.id: (context) => ChatPage(),
        MsgPage.id: (context) => MsgPage(),
        FriendList.id: (context) => FriendList(),
      }
    );
  }
}
