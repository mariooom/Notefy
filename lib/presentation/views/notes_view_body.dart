import 'package:flutter/material.dart';
import 'package:notesapp/presentation/widgets/notes_list_builder.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotesListBuilder(),
    );
  }
}
