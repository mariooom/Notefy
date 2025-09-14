import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/core/cubit/notes%20cubit/read_notes_cubit.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/widgets/custom_appbar.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';

// ignore: must_be_immutable
class EditViewBody extends StatefulWidget {
  EditViewBody(
      {super.key, required this.notes, required this.title, this.subTitle});
  final Notes notes;
  String? title, subTitle;
  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
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
              if (title != null) {
                widget.notes.title = title ?? widget.notes.title;
                widget.notes.subTitle = content ?? widget.notes.subTitle;
                widget.notes.save();
                BlocProvider.of<NotesCubit>(context).fetchNotes();
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(
            hint: widget.notes.title,
            maxLines: 1,
            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(
            hint: widget.notes.subTitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
        ],
      ),
    );
  }
}
