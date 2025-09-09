import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

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
                TextField(
                  cursorColor: kPrimaryColor,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor))),
                ),
                SizedBox(height: 10),
                TextField(
                  autocorrect: true,
                  //expands: true,
                  maxLines: 6,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                      focusColor: kPrimaryColor,
                      hintText: 'Content',
                      border: OutlineInputBorder()),
                ),
                MaterialButton(
                    color: kPrimaryColor,
                    onPressed: () {
                      
                      Navigator.pop(context);
                    },
                    child: const Text('Save')),
              ]),
            ),
          ),
        );
      },
    );
  }
}
