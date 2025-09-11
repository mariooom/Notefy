import 'package:flutter/material.dart';
import 'package:notesapp/presentation/widgets/custom_botton.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return AddNotesForm.AddNotesForm();
      },
    );
  }
}

class AddNotesForm extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const AddNotesForm.AddNotesForm({super.key});

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
              CustomBotton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
