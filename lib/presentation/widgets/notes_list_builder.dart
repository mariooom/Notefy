import 'package:flutter/material.dart';
import 'package:notesapp/presentation/widgets/note_item.dart';

class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: const NoteItem(),
        );
      },
    );
  }
}
