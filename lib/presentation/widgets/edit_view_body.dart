import 'package:flutter/material.dart';
import 'package:notesapp/presentation/widgets/custom_appbar.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomAppbar(
            title: 'Edit',
            iconData: Icons.check,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(hint: 'Title', maxLines: 1),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(hint: 'Content', maxLines: 5)
        ],
      ),
    );
  }
}
