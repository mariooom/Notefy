import 'package:flutter/material.dart';
import 'package:notesapp/presentation/widgets/custom_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.iconData, this.onPressed,
  });
  final String title;
  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 20, 3, 0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          CustomIcon(iconData: iconData, onPressed: onPressed,)
        ],
      ),
    );
  }
}
