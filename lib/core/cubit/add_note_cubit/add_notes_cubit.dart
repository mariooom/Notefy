import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInit());
  
  addnotes(Notes note) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<Notes>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } on Exception catch (e) {
      // TODO
      emit(AddNotesFailure(e.toString()));
    }
  }
}
