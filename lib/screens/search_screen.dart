import 'package:appchat/constants.dart';
import 'package:appchat/screens/chat_screen.dart';
import 'package:appchat/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static String id = 'search_screen';

  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  DatabaseMethods databaseMethods = DatabaseMethods();
  QuerySnapshot<Map<String, dynamic>>? searchSnapshot;

  ///save our upcoming data from firebase

  ///want to show search data in a list
  Widget searchList() {
    return searchSnapshot != null ?
    ListView.builder(
        shrinkWrap: true,
        itemCount: searchSnapshot?.docs.length,
        itemBuilder: (context, i) {
          return searchTile(
            username: searchSnapshot?.docs[i].data()["name"],
            userEmail: searchSnapshot?.docs[i].data()["email"],);
        }) : Container();
  }

  ///get userInfo data(name) from the firebase
  initiateSearch() {
    databaseMethods.getUsersByName(searchController.text)
        .then((value) {
      setState(() {
        searchSnapshot = value;
      });
    });
  }


  ///we want to save the data, when we logged in we have username and email and we want save this data locally inside our phone which can be access later on. It can be utilized not on the search screens also in the chat screen as well when we will be searching for all different chatroom available for our username
  ///So we will be using shared_preferences package
  chatRoom(String userName) {
    print("name : ${Constants.myName}");
    if (userName != Constants.myName) {
      ///generating unique chatroom ID
      String chatRoomID = getChatRoomId(userName, Constants.myName);
      List<String> usersList = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": usersList,
        "chatroomid": chatRoomID
      };
      databaseMethods.createChatRoom(chatRoomID, chatRoomMap);
      Navigator.pushNamed(context, ChatPage.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
              content: Text("You cannot send message to yourself", style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),)));
    }
  }


  ///search tile
  Widget searchTile({required String username, userEmail}) {
    return Container(
        child: ListTile(
            title: Text(username, style: TextStyle(fontSize: 18),),
            subtitle: Text(userEmail),
            trailing: IconButton(onPressed: () {
              chatRoom(username);
            },
              icon: Icon(Icons.message, color: Theme
                  .of(context)
                  .primaryColor, size: 28,),)
        )
    );
  }


  ///help us to generate unique chatroomID
  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
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
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search username...",
                        hintStyle: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            fontSize: 18,
                            fontStyle: FontStyle.italic
                        )
                    ),
                  )),
                  IconButton(onPressed: () {
                    initiateSearch();
                  }, icon: Icon(Icons.search,
                    color: Theme
                        .of(context)
                        .primaryColor, size: 30,),)
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}


