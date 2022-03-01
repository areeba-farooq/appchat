import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/search_screen.dart';
import 'package:appchat/services/auth.dart';
import 'package:appchat/services/helper.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthMethod authMethod = AuthMethod();

  getUserInfo() async {
    Constants.myName =  await HelperFunction.getUserName();
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
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







