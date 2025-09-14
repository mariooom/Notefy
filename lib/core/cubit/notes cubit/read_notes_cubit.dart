import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/core/cubit/notes%20cubit/notes_read_state.dart';
import 'package:notesapp/core/model/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInit());
  List<Notes>? notes;
  fetchNotes() {
    try {
      var notesBox = Hive.box<Notes>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesLoading());
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
