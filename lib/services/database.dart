
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  ///getting users by username from firebase
  getUsersByName(String username) async {
    return await FirebaseFirestore.instance.collection("users")
    .where('name', isEqualTo: username).get();
  }

  ///getting users by email from firebase
  getUsersByEmail(String userEmail) async {
    return await FirebaseFirestore.instance.collection("users")
        .where('email', isEqualTo: userEmail).get();
  }
  ///uploading user info to firebase while signup
  ///username + email >> userMap
   uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users")
   .add(userMap);
  }

  ///creating chatroom function to fetch id and user names
   createChatRoom(String chatRoomId, chatRoomMap){
    FirebaseFirestore.instance.collection("chatRooms")
        .doc(chatRoomId).set(chatRoomMap).catchError((e)=> print(e));
}

///adding conversation to firebase into the specific chat rooms
addConvoMsgs(String chatRoomId, msgMap)  {
    FirebaseFirestore.instance.collection("chatRooms")
        .doc(chatRoomId)
        .collection("chats")
        .add(msgMap)
        .catchError((e){print(e.toString());});

}
///getting that conversation from firebase into app to show by the Datetime.now()
  getConvoMsgs(String chatRoomId) async {
     return await FirebaseFirestore.instance.collection("chatRooms")
        .doc(chatRoomId)
        .collection("chats")
         .orderBy("time")
        .snapshots();
  }

  ///getting chatroom from firebase into the app when the user searches the user by uername and clicks on msg so automatically that chatroom appears on to the home screen
  getChatRooms(String userName) async {
    return await FirebaseFirestore.instance.collection("chatRooms")
        .where("users", arrayContains: userName)
        .snapshots();
  }



}