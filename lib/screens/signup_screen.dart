import 'package:appchat/Widgets/bottomText_widget.dart';
import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/services/auth.dart';
import 'package:appchat/services/database.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'home_screen.dart';


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
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthMethod authMethod = AuthMethod(); ///object
  DatabaseMethods databaseMethods = DatabaseMethods();
  signMeUp(){
    if(formKey.currentState!.validate()){
      setState(() {
        showSpinner = true;
      });
      ///registering a user to firebase auth
      authMethod.registration(emailController.text, passwordController.text)
          .then((value) => print(value));

      ///creating map for userinfo to store on firebase storage
      Map<String, String> userInfoMap = {
        "name": userNameController.text,
        "email": emailController.text,
      };

      ///sending userinfo to the firebase storage
      databaseMethods.uploadUserInfo(userInfoMap); ///accepts a Map
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(0xFF2A6971),
          content: Text('Registered Successfully! Kindly Login.',
            style: TextStyle(color: Colors.white, fontSize: 18),)));
      Navigator.pushNamed(context, HomePage.id);
    }
  }

  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  );
  @override
  void dispose() {
    super.dispose();
    //clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: showSpinner ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ): SingleChildScrollView(
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
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    } else {
                      return null;
                    }
                  },
                  controller: userNameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Enter UserName",
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
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: Buttons(
                    color: Theme.of(context).primaryColor,
                    title: 'SignUp',
                    style: kLoginSignup,
                    onPress: () {
                      signMeUp();
    }

                    ),
              ),

              BottomText(
                  title: 'Already have an account?',
                  onPress: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  text: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}
