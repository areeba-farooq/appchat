import 'package:appchat/models/msg_model.dart';
import 'package:appchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )
        ),
        child: ClipRRect(
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> ChatPage(
                      user: chats[index].sender,),
                    ),),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: chats[index].unRead ? Theme.of(context).primaryColor.withOpacity(0.1): Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(chats[index].sender.avatar),
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chats[index].sender.name,),
                                SizedBox(height: 5.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(chats[index].text,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            chats[index].unRead? Container(
                              margin: EdgeInsets.only(left: 40.0),
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).accentColor
                              ),
                              alignment: Alignment.center,
                            ) : Text(''),
                            SizedBox(height: 5.0,),
                            Text(chats[index].time,),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}