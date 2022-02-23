
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  ///getting users by username
  getUsers(String username) async {
    return await FirebaseFirestore.instance.collection("users")
    .where('name', isEqualTo: username).get();


  }

  ///uploading user info while signup
  ///username + email >> userMap
   uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users")
   .add(userMap);

   }
}