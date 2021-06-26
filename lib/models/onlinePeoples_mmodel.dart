class OnlinePeoples{
  final String name;
  final int id;
  final String avatar;
  final bool activeNow = true;

  OnlinePeoples({ required this.name, required this.avatar, required this.id});
}

List<OnlinePeoples> onlinepeoples = [
  OnlinePeoples(name: 'Shiza', avatar: 'images/onlinefriends/shiza.jpg', id: 1 ),
  OnlinePeoples(name: 'Kamran', avatar: 'images/onlinefriends/kamran.jpg', id: 2),
  OnlinePeoples(name: 'Shoaib', avatar: 'images/onlinefriends/shoaib.jpg',id: 3),
  OnlinePeoples(name: 'Sana', avatar: 'images/onlinefriends/sana.jpg', id: 4),
  OnlinePeoples(name: 'Nimra', avatar: 'images/onlinefriends/nimra.jpg',id: 5),
  OnlinePeoples(name: 'Kiran', avatar: 'images/onlinefriends/kiran.jpeg',id: 6),
  OnlinePeoples(name: 'Hunain', avatar: 'images/onlinefriends/hunain.jpg', id: 7),
  OnlinePeoples(name: 'Komal', avatar: 'images/onlinefriends/komal.jpg',id: 8),
  OnlinePeoples(name: 'Zainab', avatar: 'images/onlinefriends/zainab.jpg', id: 9),
  OnlinePeoples(name: 'Umer', avatar: 'images/onlinefriends/shoaib.jpg', id: 10),


];