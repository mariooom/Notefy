import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
        ),
        Text(
          'Notes',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Spacer(),
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              ),
            ),
          ),
        )
      ],
    );
  }
}
