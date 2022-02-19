import 'package:appchat/Widgets/drawerItems_widget.dart';
import 'package:appchat/Widgets/fav_contacts.dart';
import 'package:appchat/Widgets/recent_chats.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:flutter/material.dart';
class MsgPage extends StatefulWidget {
static String id = 'msg_page';
  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Messages', style: TextStyle(
            color: Colors.white,
            fontFamily: 'Source Sans Pro',
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0
        ),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, HomePage.id);
              },
              icon: Icon(Icons.home_filled, color: Colors.white,)),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search, color: Colors.white,))
        ],
      ),
      drawer: buildDrawer(),
        body: Column(
          children: [
            FavContacts(),
            RecentChats(),

          ],
        ),
    );
  }
}





