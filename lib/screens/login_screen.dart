import 'package:appchat/Widgets/bottomText_widget.dart';
import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/Widgets/inputField_widget.dart';
import 'package:appchat/constants.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:appchat/services/auth.dart';
import 'package:appchat/services/database.dart';
import 'package:appchat/services/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginPage extends StatefulWidget {
static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;
  AuthMethod authMethod = AuthMethod(); ///object
  DatabaseMethods databaseMethods = DatabaseMethods();
  QuerySnapshot<Map<String, dynamic>>? userInfoSnapshot; ///save our upcoming data from firebase

  final OutlineInputBorder border = OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  );


  ///Function
  signMeIn(){
    if(formKey.currentState!.validate()){
      setState(() {
        showSpinner = true;
      });


      ///saves the value to shared preferences
      HelperFunction.saveUserEmail(emailController.text);


      ///sending userinfo to the firebase storage
      databaseMethods.getUsersByEmail(emailController.text).then((value){
        userInfoSnapshot = value;
        ///saving that offline in the shared preferences
        HelperFunction.saveUserEmail(userInfoSnapshot?.docs[0].data()['name']);
      }); ///accepts a Map

      ///LOGGING USER IN
      authMethod.loginUser(context, emailController.text, passwordController.text)
          .then((value) {
            if(value != null){
              ///when data uploaded, it saves the logged-in info tp shared preferences
              HelperFunction.saveUserLoggedIn(true);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color(0xFF2A6971),
                  content: Text('Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 18),)));
              Navigator.pushNamed(context, HomePage.id);
            }
      });


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 300.0,
                  child: Image.asset('images/appchat.png'),
                ),
              ),
              SizedBox(height: 40.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email address';
                    } else if (!value.contains('@')) {
                      return 'Please enter Valid Email Address';
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Enter email address",
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length <= 8) {
                      return 'Password should be 8 characters long';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),

              SizedBox(height: 24.0,),
              Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Buttons(color: Theme.of(context).primaryColor, title: 'Login', style: kLoginSignup,
                    onPress: () {
                    signMeIn();
                    }
                  )
              ),

              SizedBox(height: 30.0,),
              BottomText(title: "Don't have an account?",
                onPress: (){Navigator.pushNamed(context, Signup.id);}, text: 'SignUp',)
            ],
          ),
        ),
      ),
    );
  }
}




