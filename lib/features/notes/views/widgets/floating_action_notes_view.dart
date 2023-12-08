import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/size.dart';
import 'add_note_bottom_sheet.dart';

class FloatingActionNotesView extends StatelessWidget {
  const FloatingActionNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r16),
            ),
            builder: (context) {
              return const AddNoteBottomSheet();
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
