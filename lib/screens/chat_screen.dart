import 'package:appchat/models/onlinePeoples_mmodel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static String id = 'chat_page';

  final OnlinePeoples user;
  ChatPage({required this.user,});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(widget.user.name,),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
        actions: [
          Icon(Icons.more_horiz,color: Colors.black,)
        ],
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: 60.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor

            // borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.emoji_emotions_outlined),
                iconSize: 22.0,
                color: Colors.white,
              ),

              IconButton(
                onPressed: (){},
                icon: Icon(Icons.photo),
                iconSize: 22.0,
                color: Colors.white,
              ),
              Expanded(child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(
                    hintText: 'Type a message...',
                    hintStyle: TextStyle(
                        fontFamily: 'Yanonekafeesatz',
                        fontSize: 18.0,
                        color: Colors.white
                    )
                ),
              )),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.send),
                iconSize: 22.0,
                color: Colors.white,
              )
            ],
          ),
        ),
    ]
      ),

    );
  }
}
