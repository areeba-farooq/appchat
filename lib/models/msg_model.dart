import 'package:appchat/models/onlinePeoples_mmodel.dart';
class MsgModel {
  final OnlinePeoples sender;
  final String time;
  final String text;
  final bool unRead;

  MsgModel({
    required this.sender,
    required this.time,
    required this.text,
    required this.unRead
  });
}
final OnlinePeoples shiza = OnlinePeoples(
  id: 1,
  name: 'Shiza',
  avatar: 'images/onlinefriends/shiza.jpg',
);

final OnlinePeoples kamran = OnlinePeoples(
  id: 2,
  name: 'Kamran',
  avatar: 'images/onlinefriends/kamran.jpg',
);
final OnlinePeoples shoaib = OnlinePeoples(
  id: 3,
  name: 'Shoaib',
  avatar: 'images/onlinefriends/shoaib.jpg',
);
final OnlinePeoples sana = OnlinePeoples(
  id: 4,
  name: 'Sana',
  avatar: 'images/onlinefriends/sana.jpg',
);
final OnlinePeoples nimra = OnlinePeoples(
  id: 5,
  name: 'Nimra',
  avatar: 'images/onlinefriends/nimra.jpg',
);
final OnlinePeoples kiran = OnlinePeoples(
  id: 6,
  name: 'Kiran',
  avatar: 'images/onlinefriends/kiran.jpeg',
);
final OnlinePeoples hunain = OnlinePeoples(
  id: 7,
  name: 'Hunain',
  avatar: 'images/onlinefriends/hunain.jpg',
);

final OnlinePeoples komal = OnlinePeoples(
  id: 7,
  name: 'Komal',
  avatar: 'images/onlinefriends/komal.jpg',
);

final OnlinePeoples zainab = OnlinePeoples(
  id: 7,
  name: 'Zainab',
  avatar: 'images/onlinefriends/zainab.jpg',
);

final OnlinePeoples umer = OnlinePeoples(
  id: 7,
  name: 'Umer',
  avatar: 'images/onlinefriends/shoaib.jpg',
);

//Favourites:
List<OnlinePeoples> favs = [sana,umer, kamran, kiran, shiza, komal];

//CHATS ON THE HOME SCREEN:
List<MsgModel> chats = [
  MsgModel(
    sender: sana,
    time: '2:30 PM',
    text: 'haha.. ok phir miltey hai',
    unRead: true,
  ),
  MsgModel(
    sender: komal,
    time: '3:55 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unRead: true,
  ),
  MsgModel(
    sender: kamran,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unRead: false,
  ),
  MsgModel(
    sender: kiran,
    time: '5:25 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unRead: true,
  ),
  MsgModel(
    sender: shiza,
    time: '6:12 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unRead: false,
  ),
  MsgModel(
    sender: shoaib,
    time: '6:55 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unRead: false,

  ),
  MsgModel(
      sender: zainab,
      time: '7:10 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      unRead: false),
];
