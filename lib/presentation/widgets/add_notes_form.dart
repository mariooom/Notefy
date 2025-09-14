import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/core/model/note_model.dart';
import 'package:notesapp/presentation/widgets/colors_list_view.dart';
import 'package:notesapp/presentation/widgets/custom_botton.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/core/cubit/add_note_cubit/add_notes_state.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm.AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  //Date Format
  String formatedDate =
      DateFormat.yMMMd('en_US').add_jm().format(DateTime.now());

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
          padding: EdgeInsets.only(
            left: 19.0,
            right: 19,
            top: 19,
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, //to elevate bottom sheet when the keyboard shows
          ),
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
              ColorsList(),
              BlocBuilder<AddNotesCubit, AddNotesState>(
                builder: (context, state) {
                  return CustomBotton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        var formatedDate =
                            DateFormat.yMEd().format(DateTime.now());
                        var noteModel = Notes(
                          title: title!,
                          subTitle: subTitle!,
                          date: formatedDate,
                          color: Colors.blue.value,
                        );
                        BlocProvider.of<AddNotesCubit>(context)
                            .addnotes(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
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

