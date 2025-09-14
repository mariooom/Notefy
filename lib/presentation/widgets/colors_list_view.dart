import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isAktiv, required this.color});

  final bool isAktiv;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isAktiv
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: CircleAvatar(
              radius: 21,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: color,
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
      height: 28 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<AddNotesCubit>(context).color = kColors[index];
              colorIndex = index;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: (2.0)),
              child: ColorItem(
                isAktiv: colorIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
