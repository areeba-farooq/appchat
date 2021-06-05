import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String title;
  final onPress;
  final String text;

  BottomText({required this.title, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        TextButton(onPressed: onPress, child: Text(text)
        )
      ],
    );
  }
}