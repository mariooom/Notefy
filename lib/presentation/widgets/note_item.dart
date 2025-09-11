import 'package:flutter/material.dart';
import 'package:notesapp/presentation/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text('Note 1',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              subtitle: Text(
                'ssk',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              trailing: IconButton(
                padding: EdgeInsets.only(left: 163),
                onPressed: () {},
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
                '9/9/2025',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
