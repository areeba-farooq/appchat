import 'package:appchat/Widgets/bottomText_widget.dart';
import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/Widgets/inputField_widget.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Signup extends StatefulWidget {
static String id = 'signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String username;
  late String email;
  late String password;
  bool showSpinner = false;
  //private property
  final _auth = FirebaseAuth.instance; // static instance of firebaseAuth class.



  final OutlineInputBorder border = OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
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
              InputField(border: border, title: 'Enter User Name',
                  onChange: (value){
                username = value;

                  }, obsecure:  false,),

              SizedBox(height: 20.0,),
              InputField(border: border, title: 'Enter your Email',
                  onChange: (value){
                email = value;

                  }, obsecure: false,
              textInputType: TextInputType.emailAddress,),

              SizedBox(height: 20.0,),
              InputField(border: border, title: 'Enter your password',
                  onChange: (value){
                password = value;
                  }, obsecure: true,),

              SizedBox(height: 24.0,),
              Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: Buttons(color: Theme.of(context).primaryColor, title: 'SignUp', style: kLoginSignup,
                  onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });

                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,password: password);
                      if(newUser != null) {
                        Navigator.pushNamed(context, HomePage.id);}
                      setState(() {
                        showSpinner = false;
                      });
                      }  catch (e) {
                      print(e);
                    }
                }),
              ),
              SizedBox(height: 30.0,),
              BottomText(title: 'Already have an account?',
                  onPress: (){Navigator.pushNamed(context, LoginPage.id);}, text: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}
