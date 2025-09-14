import 'package:flutter/material.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/views/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.notes});
  final Notes notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(
        notes: notes, title: notes.title,
        subTitle: notes.subTitle,
      ),
    );
  }
}
