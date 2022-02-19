import 'package:appchat/models/msg_model.dart';
import 'package:appchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavContacts extends StatelessWidget {
  const FavContacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favourite Contacts',),
                IconButton(
                  icon: Icon(Icons.more_horiz,
                    color: Colors.blueGrey,),
                  iconSize: 30.0,
                  onPressed: (){print('Pressed dots');},)
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal ,
                itemCount: favs.length,
                itemBuilder: (context, i){
                  return GestureDetector(
                    onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> ChatPage(
                      ),
                      ),),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(favs[i].avatar),
                          ),
                          SizedBox(height: 6.0,),
                          Text(favs[i].name,),
                        ],
                      ),
                    ),
                  );
                }),

          )
        ],
      ),
    );
  }
}