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
  QuerySnapshot<Map<String, dynamic>>? searchSnapshot; ///save our upcoming data from firebase

  ///get userInfo data(name) from the firebase
  initiateSearch(){
    databaseMethods.getUsers(searchController.text)
        .then((value){
          setState((){
      searchSnapshot = value;
          });
    });
  }
  ///want to show search data in a list
  Widget searchList(){
    return searchSnapshot != null ?
    ListView.builder(
      shrinkWrap: true,
      itemCount: searchSnapshot?.docs.length,
        itemBuilder: (context, i){
      return SearchTile(
          username: searchSnapshot?.docs[i].data()["name"],
          userEmail:  searchSnapshot?.docs[i].data()["email"],);

    }): Container();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal:20, vertical: 15 ),
              child: Row(
                children: [
                  Expanded(child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search username...",
                      hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      )
                    ),
                  )),
                  IconButton(onPressed: (){
                    initiateSearch();
                  },icon: Icon(Icons.search,
                  color: Theme.of(context).primaryColor, size: 30,),)
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

class SearchTile extends StatelessWidget {
  final String username;
  final String userEmail;
  const SearchTile({Key? key, required this.username, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(username),
        subtitle: Text(userEmail),
        trailing: ElevatedButton(
          onPressed: (){},
            child: Text("Message"),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor
          ),
        ),
      )
    );
  }
}

