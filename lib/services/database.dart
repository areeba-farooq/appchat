
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  ///getting users by username
  getUsersByName(String username) async {
    return await FirebaseFirestore.instance.collection("users")
    .where('name', isEqualTo: username).get();
  }

  ///getting users by email
  getUsersByEmail(String userEmail) async {
    return await FirebaseFirestore.instance.collection("users")
        .where('email', isEqualTo: userEmail).get();
  }
  ///uploading user info while signup
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

getConvoMsgs(String chatRoomId, msgMap){
    FirebaseFirestore.instance.collection("chatRooms")
        .doc(chatRoomId)
        .collection("chats")
        .add(msgMap)
        .catchError((e){print(e.toString());});

}



}