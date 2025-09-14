import 'package:flutter/material.dart';
import 'package:notesapp/presentation/widgets/bottom_sheet.dart';
import 'package:notesapp/presentation/widgets/custom_appbar.dart';
import 'package:notesapp/presentation/views/notes_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          CustomAppbar(
            title: 'Notefy',
            iconData: Icons.search,
          ),
          NotesViewBody(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 3,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return CustomBottomSheet();
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
