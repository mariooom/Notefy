import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_state.dart';
import 'package:notesapp/core/model/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInit());
  Color color = Color(0xff8963ba);
  addnotes(Notes note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<Notes>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } on Exception catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
