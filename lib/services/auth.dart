


import 'package:appchat/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethod{
  //private property
  final _auth = FirebaseAuth.instance;


  ///getting the user id
  UserModels _userModels(User firebaseUser){
    return UserModels(userId: firebaseUser.uid);
  }


  ///LoginUser method
  Future loginUser(BuildContext context,String email, String password) async
  {
    try {
      final loggedinUser =
      await _auth.signInWithEmailAndPassword(
        email: email, password: password,);
      User? firebaseUser = loggedinUser.user;
      return _userModels(firebaseUser!);

    }
    catch (e) {
      print(e.toString());
    }
  }


  ///registration method
  Future registration(String email, String password) async {
    try{
      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = newUser.user;
      return _userModels(firebaseUser!);

    } catch(e){
      print(e.toString());
    }
  }


  ///reset password
Future resetPassword(String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    } catch(e){
      print(e.toString());
    }
}

///SignOut method
Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
    }
}
}