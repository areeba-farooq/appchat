import 'package:appchat/constants.dart';
import 'package:appchat/screens/chat_screen.dart';
import 'package:appchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class buildDrawer extends StatelessWidget {
  const buildDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Doctor Mike', style: kDrawerNameStyle),
              accountEmail: Text('drmike45@gmail.com',style: kDrawerTagLine),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/mike.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              )
          ),
          DrawerItems(title: 'Profile', onTap: (){}, icon: Icons.person,),
          DrawerItems(title: 'Friends', onTap: (){}, icon: FontAwesomeIcons.userFriends,),
          DrawerItems(title: 'Chats', onTap: (){ Navigator.pushNamed(context, ChatPage.id);}, icon: Icons.message,),
          DrawerItems(title: 'Request', onTap: (){}, icon: FontAwesomeIcons.userPlus,),
          DrawerItems(title: 'Block List', onTap: (){}, icon: Icons.block,),
          DrawerItems(title: 'Settings', onTap: (){}, icon: Icons.settings,),
          DrawerItems(title: 'About', onTap: (){}, icon: FontAwesomeIcons.question,),
          DrawerItems(title: 'Logout', onTap: (){ Navigator.pushNamed(context, WelcomePage.id);}, icon: FontAwesomeIcons.signOutAlt,),
        ],
      ),

    );
  }
}
class DrawerItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final onTap;

  DrawerItems({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: kDrawerItemStyle),
        leading: Icon(icon, size: 20.0,color: Theme.of(context).accentColor),
        onTap: onTap
    );
  }
}