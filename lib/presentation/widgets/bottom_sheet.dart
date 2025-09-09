import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/presentation/widgets/custom_textfield.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
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
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Add Note'),
                ),
                CustomTextfield(
                  hint: 'Title',
                  maxLines: 1,
                ),
                SizedBox(height: 10),
                CustomTextfield(
                  hint: 'Content',
                  maxLines: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    minWidth: 350,
                    child: const Text('Save')),
              ]),
            ),
          ),
        );
      },
    );
  }
}
