import 'package:appchat/Widgets/button_widget.dart';
import 'package:appchat/constants.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
//ticker provider our state object
//act as a ticker for a single animation
class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin{
  //Mixin enable your class with different types of capabilities
  //Mixins are the way to reusing class code in multiple hierarchies
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 3),
    vsync: this, //act as a ticker for our animation
      ///if we have curved Animation we cannot have upperbound value greater than 1
      // upperBound: 100.0
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
     animation = ColorTween(begin:Colors.blueGrey, end: Colors.white).animate(controller);



///in 1 seconds we might get 60 ticks on our Ticker
    controller.forward(); ///precede our animation to forward


    ///we can detect when the animation is completed
    // animation.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   } else if(status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });
    controller.addListener(() {/// we can listen the values on the controller
      setState(() {});
      // print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200,
                  child: Image.asset('images/appchat.png'),
                ),
              ),
            ),

            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('App Chat',
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle(
                  fontSize: 70.0,
                  color: Theme.of(context).accentColor,
                  fontFamily: 'Dancing Script',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0
              ),
                )]
              ),

            SizedBox(height: 40.0,),
            Buttons(title: 'Login', onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));},
              color: Theme.of(context).primaryColor, style:  kWelcomeButtons,),
            Buttons(color: Theme.of(context).accentColor, onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
            }, title: 'Signup', style: kWelcomeButtons,),
          ],
        ),
      ),
    );
  }
}

