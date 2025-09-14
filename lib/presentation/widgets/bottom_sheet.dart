import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_state.dart';
import 'package:notesapp/presentation/widgets/add_notes_form.dart';

import '../../core/cubit/notes cubit/read_notes_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: SizedBox(
        height: 1000,
        child: SingleChildScrollView(
            child: BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return BlocListener<AddNotesCubit, AddNotesState>(
              listener: (context, state) {
                if (state is AddNotesFailure) {
              print('Failed ${state.errMessage}');
                }
                if (state is AddNotesSuccess) {
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  Navigator.pop(context);
                }
              },
              child: AbsorbPointer(
                absorbing:
                    false, //to limit user actions if loading form a DB or an API
                child: AddNotesForm.AddNotesForm(),
              ),
            );
          },
        )),
      ),
    );
  }
}
