import 'package:appchat/Widgets/drawerItems_widget.dart';
import 'package:appchat/models/onlinePeoples_mmodel.dart';
import 'package:appchat/screens/messages_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FriendList extends StatefulWidget {
  static String id ='friend_list';

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Friends List', style: TextStyle(
            color: Colors.white,
            fontFamily: 'Source Sans Pro',
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0
        ),),
        actions: [
          IconButton(
              onPressed: (){
                print('search');
              },
              icon: Icon(Icons.search, color: Colors.white,))
        ],
      ),
      drawer: buildDrawer(),
      body: Container(
        child: ListView.builder(
          itemCount:  onlinepeoples.length,
            itemBuilder: (context, index) {
            return Stack(
              children: [
              Positioned(
                child: Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(onlinepeoples[index].avatar),
                  ),
                ),
              ),
                Positioned(
                  top: 30.0,
                  left: 80.0,
                  child: Text(onlinepeoples[index].name, style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500
                  ),)
                ),
                Positioned(
                  left: 260.0,
                  top: 20.0,
                  child: Container(
                    height: 30.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Center(child: IconButton(onPressed: () {
                      Navigator.pushNamed(context, MsgPage.id);
                    },
                      icon: Icon(Icons.message, color: Colors.white,size: 18.0,),

              )
                   ),
                  ),
                ),
                Positioned(
                  left: 320.0,
                  top: 20.0,
                  child: Container(
                    height: 30.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Center(child: TextButton(child: Text('remove', style: TextStyle(
                        color: Colors.white
                    ),), onPressed: (){},)),
                  ),
                )
              ]
            );
            }),
      ),
    );
  }
}

