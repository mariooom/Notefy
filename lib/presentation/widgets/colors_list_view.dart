import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isAktiv});

  final bool isAktiv;

  @override
  Widget build(BuildContext context) {
    return isAktiv
        ? const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: CircleAvatar(
              radius: 21,
              backgroundColor: Colors.blue,
            ),
          )
        : const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown,
          );
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.4),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                colorIndex = index;
                setState(() {});
              },
              child: ColorItem(
                isAktiv: colorIndex == index,
              ),
            );
          },
        ),
      ),
    );
  }
}
