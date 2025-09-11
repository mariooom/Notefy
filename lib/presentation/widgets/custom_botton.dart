import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: kPrimaryColor,
        onPressed: onTap,
        minWidth: 350,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Text('Save'));
  }
}
