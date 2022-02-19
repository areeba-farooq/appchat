import 'package:appchat/models/onlinePeoples_mmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

CollectionReference addMsgs = FirebaseFirestore.instance.collection('messages');
User? loggedInUser;

class ChatPage extends StatefulWidget {
  static String id = 'chat_page';

  //    OnlinePeoples? user;
  // ChatPage({this.user,});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  late String mesgText;
  TextEditingController _editingController = TextEditingController();

  //check to see if current user signed in
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  //get msgs from firebase database
  // void getMsg() async{
  //   final msgs = await
  //   addMsgs.get();
  //   for (var msg in msgs.docs){
  //     print(msg.data());
  //   }
  // }

  ///getting msgs to firebase database and it will notify when there is a change or new msgs through stream snapshots
  // Future msgStream() async{
  //    await for(var snapshot in addMsgs.snapshots()){
  //      for (var msg in snapshot.docs){
  //             print(msg.data());
  //          }
  //    }
  // }

  ///add msgs to the firebase database
  Future addUserMesg() {
    return addMsgs
        .add({
          'text': mesgText,
          'sender': loggedInUser?.email,
        })
        .then((value) => print('msg added $value'))
        .catchError((e) => print('Failed to send messages $e'));
  }

  clearText() {
    _editingController.clear();
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
        actions: [
          Icon(
            Icons.more_horiz,
            color: Colors.black,
          )
        ],
        elevation: 0.0,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyMsgsStream(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 60.0,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor

                  // borderRadius: BorderRadius.circular(30.0)
                  ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.emoji_emotions_outlined),
                    iconSize: 22.0,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.photo),
                    iconSize: 22.0,
                    color: Colors.white,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _editingController,
                    onChanged: (value) {
                      mesgText = value;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                            fontFamily: 'Yanonekafeesatz',
                            fontSize: 18.0,
                            color: Colors.white)),
                  )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        addUserMesg();
                        clearText();
                      });
                    },
                    icon: Icon(Icons.send),
                    iconSize: 22.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ]),
    );
  }
}

class MyMsgsStream extends StatelessWidget {
  const MyMsgsStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        ///list of documents >> querysnapshots
        StreamBuilder<QuerySnapshot>(
            stream: addMsgs.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              if (snapshot.hasData) {
                List<MesgBubble> msgList = [];
                snapshot.data?.docs.map((doc) {
                  final msgText = (doc.data() as Map)['text'];

                  ///got the user who send msgs
                  final msgSender = (doc.data() as Map)['sender'];

                  ///got the user who currently logged in
                  final currentUser = loggedInUser?.email;
                  if (currentUser == msgSender) {
                    //MSG from the logged in user
                  }

                  final mesgBubble = MesgBubble(
                    text: msgText,
                    sender: msgSender,
                    isMe: currentUser == msgSender,
                  );
                  msgList.add(mesgBubble);
                }).toList();
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    children: msgList,
                  ),
                );
              }
              return Container();
            });
  }
}

class MesgBubble extends StatelessWidget {
  const MesgBubble(
      {Key? key, required this.isMe, required this.text, required this.sender})
      : super(key: key);
  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Material(
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))
                    : BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                elevation: 5.0,
                color: isMe ? Color(0xFF2A6971) : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 18,
                        color: isMe ? Colors.white : Colors.black87),
                  ),
                )),
          ],
        ));
  }
}
