import 'package:appchat/Widgets/drawerItems_widget.dart';
import 'package:appchat/Widgets/peopleContainer_widget.dart';
import 'package:appchat/models/onlinePeoples_mmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Home', style: TextStyle(
          color: Colors.white,
          fontFamily: 'Dancing Script',
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0
        ),),
      ),
      drawer: buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('PEOPLE YOU MAY KNOW : ', style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0
              ),),
            ),
            PeoplesContainer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('ACTIVE PEOPLES : ', style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0
              ),),
            ),
      Container(
        height: 400,
        child: ListView.builder(
            itemCount: onlinepeoples.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  print('open chat');
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(onlinepeoples[index].avatar),
                        backgroundColor: Colors.red,
                      ),
                    title: Text(onlinepeoples[index].name),
                    subtitle: Text('Active Now'),
                    trailing: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.green
                      ),
                    )

                    ),
                )

        );
        }),
    )

          ],
        ),
      ),
    );
  }
}






