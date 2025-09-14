import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/core/cubit/notes%20cubit/read_notes_cubit.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});

  final Notes notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(notes: notes,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(notes.title,
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              subtitle: Text(
                notes.subTitle,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              trailing: IconButton(
                padding: EdgeInsets.only(left: 163),
                onPressed: () {
                  notes.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 23,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                notes.date,
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
