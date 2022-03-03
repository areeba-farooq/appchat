import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/search_screen.dart';
import 'package:appchat/services/auth.dart';
import 'package:appchat/services/database.dart';
import 'package:appchat/services/helper.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'chat_screen.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthMethod authMethod = AuthMethod();
  DatabaseMethods databaseMethods = DatabaseMethods();
  Stream? chatRoomAppears;


  Widget chatRoomList(){
    return StreamBuilder(
      stream: chatRoomAppears,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
                  'Something went wrong!',
                  style: TextStyle(fontSize: 25),
                ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return chatRoomAppears != null ? ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                return ChatRoomTile(userName: snapshot.data.docs[index]["chatroomid"].toString().replaceAll("_", "")
                    .replaceAll(Constants.myName, ""),
                  chatRoomID: snapshot.data.docs[index]["chatroomid"],
                );

            }): Container();
          }
      return Container();
    });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  getUserInfo() async {
    Constants.myName =  await HelperFunction.getUserName(); ///once we get this value then
    databaseMethods.getChatRooms(Constants.myName).
    then((value){
      setState(() {
        chatRoomAppears = value;
      });
    });
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
        children: [
          // Center(
          //   child: Text( "You Don't have any friends yet", style: TextStyle(
          //       color: Colors.black54,
          //       fontSize: 20.0
          //   ),),
          // ),
          chatRoomList()

        ],
      ),
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  const ChatRoomTile({Key? key, required this.userName, required this.chatRoomID}) : super(key: key);
  final String userName;
  final String chatRoomID;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(chatRoomID)));
        },
        leading: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF2A6971),
            borderRadius: BorderRadius.circular(30)
          ),
            child: Text("${userName.substring(0,1). toUpperCase()}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
        title: Text(userName, style: TextStyle(color: Color(0xFF2A6971), fontSize: 20),),
      ),
    );
  }
}








