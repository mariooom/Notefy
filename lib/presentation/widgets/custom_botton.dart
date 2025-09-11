import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: kPrimaryColor,
        onPressed: onTap,
        minWidth: 350,
        child: const Text('Save'));
  }
}
