import 'package:appchat/models/peoples_model.dart';
import 'package:flutter/material.dart';

class PeoplesContainer extends StatelessWidget {
  const PeoplesContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: peoples.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.all(8.0),
              child: Stack(
                clipBehavior: Clip.none,
                // fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(peoples[index].avatar),
                    radius: 40.0,
                  ),

                  Positioned(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide.none,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          print('buhhh');
                          },
                        // TODO: Icon not centered.
                        child: Center(
                          child: Icon(Icons.add,
                            color: Colors.white,),
                        ),
                        padding: EdgeInsets.only(right: 15.0, left: 1.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:70.0, left: 5.0),
                    child: Container(
                      width: 65.0,
                      height: 20.0,
                      child: Center(
                        child: Text(peoples[index].name, style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0
                        ),),
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}