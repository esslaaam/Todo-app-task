import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/my_navigate.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/features/notes/models/note_model.dart';
import 'package:todo_app/features/notes/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  final void Function()? onPressed;

  const NoteItem({Key? key, required this.note, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context: context,
            widget: EditNoteView(
              note: note,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(AppRadius.r16),
        ),
        padding: EdgeInsetsDirectional.only(
            end: width(context) * 0.015,
            top: height(context) * 0.025,
            bottom: height(context) * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                    fontSize: AppFonts.t20,
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.bold,
                    height: height(context) * 0.0017),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: width(context) * 0.015),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      fontSize: AppFonts.t16,
                      color: AppColors.kWhite,
                      height: height(context) * 0.0017),
                ),
              ),
              trailing: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.kWhite,
                  size: k30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(context) * 0.025),
              child: Text(
                note.date,
                style:
                    TextStyle(color: AppColors.kWhite, fontSize: AppFonts.t13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
