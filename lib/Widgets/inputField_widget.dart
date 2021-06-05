import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({required this.border, required this.title,required this.onChange});

  final OutlineInputBorder border;
  final onChange;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: title,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}