import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.025),
        child: const Column(
          children: [
            CustomAppBar(
              title: 'Notes',
              isShowIcon: true,
            ),
            Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    );
  }
}
