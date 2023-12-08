import 'package:flutter/material.dart';
import 'widgets/floating_action_notes_view.dart';
import 'widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionNotesView(),
      body: NotesViewBody(),
    );
  }
}
