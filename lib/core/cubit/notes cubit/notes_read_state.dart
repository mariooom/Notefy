abstract class NotesState {}

class NotesInit extends NotesState {}

class NotesLoading extends NotesState{}

class NotesSuccess extends NotesState{
  
}

class NotesFailure extends NotesState {
  final String errMessage;
  NotesFailure(this.errMessage);
}
