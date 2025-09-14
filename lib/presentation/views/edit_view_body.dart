import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/core/cubit/notes%20cubit/read_notes_cubit.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/views/home_view.dart';
import 'package:notesapp/presentation/widgets/colors_list_view.dart';
import 'package:notesapp/presentation/widgets/custom_appbar.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';

// ignore: must_be_immutable
class EditViewBody extends StatefulWidget {
  EditViewBody({
    super.key,
    required this.notes,
    required this.title,
    this.subTitle,
  });
  final Notes notes;
  String? title, subTitle;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  late int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = kColors.indexWhere(
      (color) => color.value == widget.notes.color,
    );
    if (currentIndex == -1) currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomAppbar(
            title: 'Edit',
            iconData: Icons.check,
            onPressed: () {
              widget.notes.title = title ?? widget.notes.title;
              widget.notes.subTitle = content ?? widget.notes.subTitle;
              widget.notes.color = kColors[currentIndex].value;
              widget.notes.save();
              BlocProvider.of<NotesCubit>(context).fetchNotes();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              );
            },
          ),
          const SizedBox(height: 10),
          CustomTextfield(
            hint: widget.notes.title,
            maxLines: 1,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 10),
          CustomTextfield(
            hint: widget.notes.subTitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 30),
          EditViewColorList(
            notes: widget.notes,
            selectedIndex: currentIndex,
            onColorSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class EditViewColorList extends StatelessWidget {
  const EditViewColorList({
    super.key,
    required this.notes,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  final Notes notes;
  final int selectedIndex;
  final Function(int) onColorSelected;

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
              onColorSelected(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ColorItem(
                isAktiv: selectedIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
