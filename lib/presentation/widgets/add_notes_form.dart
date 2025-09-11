import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_state.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/widgets/custom_botton.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm.AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Add Note'),
              ),
              CustomTextfield(
                hint: 'Title',
                maxLines: 1,
                onSaved: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 10),
              CustomTextfield(
                hint: 'Content',
                maxLines: 5,
                onSaved: (value) {
                  subTitle = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<AddNotesCubit, AddNotesState>(
                builder: (context, state) {
                  return CustomBotton(
                    isLoading: state is AddNotesLoading ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = Notes(
                            title: title!,
                            subTitle: subTitle!,
                            date: DateTime.now().toString(),
                            color: Colors.blue.value);
                        BlocProvider.of<AddNotesCubit>(context)
                            .addnotes(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      //Navigator.pop(context);
                    },
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
