import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

final List<Color> color = [
  Color(0xffd7bcc8),
  Color(0xffbf9aca),
  Color(0xffdbad6a),
  Color(0xff7a6174),
  Color(0xffcdc6ae),
  Color(0xff8963ba),
  Color(0xffbacdb0)
];

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
          itemCount: color.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<AddNotesCubit>(context).color = color[index];
                colorIndex = index;
                setState(() {});
              },
              child: ColorItem(
                isAktiv: colorIndex == index,
                color: color[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
