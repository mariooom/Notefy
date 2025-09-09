import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Title'),
            )
          ],
        );
      },
    );
  }
}
