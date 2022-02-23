import 'package:appchat/Widgets/drawerItems_widget.dart';
import 'package:appchat/Widgets/peopleContainer_widget.dart';
import 'package:appchat/models/msg_model.dart';
import 'package:appchat/models/onlinePeoples_mmodel.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/messages_screen.dart';
import 'package:appchat/screens/search_screen.dart';
import 'package:appchat/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class HomePage extends StatefulWidget {
static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  AuthMethod authMethod = AuthMethod();



@override
  void initState() {
    super.initState();
    getCurrentUser();
  }


  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);

      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/appchat.png",)),
            SizedBox(width: 20,),
            Text('AppChat', style: TextStyle(
                color: Colors.white,
                fontFamily: 'Dancing Script',
                fontSize: 28.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0
            ),),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){
                authMethod.signOut();
                Navigator.pushReplacementNamed(context, LoginPage.id);
              },
              icon: Icon(Icons.logout, color: Colors.white,)),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchPage()));
              },
              icon: Icon(Icons.search, color: Colors.white,))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text( "You Don't have any friends yet", style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0
            ),),
          ),

        ],
      ),
    );
  }
}







