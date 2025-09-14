import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/core/cubit/notes%20cubit/notes_read_state.dart';
import 'package:notesapp/core/cubit/notes%20cubit/read_notes_cubit.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/widgets/note_item.dart';

// ignore: must_be_immutable
class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<Notes> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: NoteItem(notes: notes[index]),
            );
          },
        );
      },
    );
  }
}
