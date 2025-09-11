import 'package:notesapp/core/model/note_model.dart';

abstract class NotesState {}

class NotesInit extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {
  final List<Notes> note;
  NotesSuccess(this.note);
}

class NotesFailure extends NotesState {
  final String errMessage;
  NotesFailure(this.errMessage);
}
