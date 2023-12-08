import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/notes/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:todo_app/features/notes/models/note_model.dart';
import 'widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;

  const EditNoteView({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit()..getNoteDetails(note: note),
      child: Scaffold(
        body: EditNoteViewBody(note: note),
      ),
    );
  }
}
