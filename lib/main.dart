import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/simplebloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'core/cubit/notes cubit/read_notes_cubit.dart';
import 'package:notesapp/presentation/views/home_view.dart';

Future<void> main() async {
  Bloc.observer = SimplleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesAdapter());
  await Hive.openBox<Notes>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(
      create: (context) => NotesCubit()..fetchNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Merienda',
        ),
        home: const HomeView(),
      ),
    );
  }
}
