import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hint, required this.maxLines});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: buildBorder(),
        //enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        hintText: hint,
        
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.elliptical(10, 5),
      ),
      borderSide: BorderSide(color: Colors.white));
}
