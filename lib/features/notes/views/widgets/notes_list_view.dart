import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/features/notes/controllers/notes_cubit/notes_cubit.dart';
import 'empty_notes.dart';
import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<NotesCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height(context) * 0.016),
          child: cubit.notes!.isEmpty
              ? const EmptyNotes()
              : ListView.builder(
                  itemCount: cubit.notes!.length,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height(context) * 0.008),
                      child: NoteItem(
                        onPressed: () {
                          cubit.notes![index].delete();
                          cubit.fetchAllNotes();
                        },
                        note: cubit.notes![index],
                      ),
                    );
                  }),
        );
      },
    );
  }
}
