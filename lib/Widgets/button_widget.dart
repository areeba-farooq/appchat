import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color color;
  final  onPress;
  final String title;
  final style;
  Buttons({required this.color, required this.onPress, required this.title, required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title, style: style),
        ),

      ),
    );
  }
}
