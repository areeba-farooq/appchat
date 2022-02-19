import 'package:appchat/Widgets/drawerItems_widget.dart';
import 'package:appchat/Widgets/peopleContainer_widget.dart';
import 'package:appchat/models/msg_model.dart';
import 'package:appchat/models/onlinePeoples_mmodel.dart';
import 'package:appchat/screens/messages_screen.dart';
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
        title: Text('Home', style: TextStyle(
          color: Colors.white,
          fontFamily: 'Source Sans Pro',
          fontSize: 25.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0
        ),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, MsgPage.id);
              },
              icon: Icon(Icons.message, color: Colors.white,)),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search, color: Colors.white,))
        ],
      ),
      drawer: buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('PEOPLE YOU MAY KNOW : ', style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0
              ),),
            ),
            PeoplesContainer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('ACTIVE PEOPLES : ', style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0
              ),),
            ),
      Container(
        height: 460,
        child: ListView.builder(
            itemCount: onlinepeoples.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder:
                     (context) => ChatPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(onlinepeoples[index].avatar),
                        backgroundColor: Colors.red,
                      ),
                    title: Text(onlinepeoples[index].name),
                    subtitle: Text('Active Now'),
                    trailing: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.green
                      ),
                    )

                    ),
                )

        );
        }),
    )

          ],
        ),
      ),
    );
  }
}







