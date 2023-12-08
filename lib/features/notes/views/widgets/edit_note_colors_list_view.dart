import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/features/notes/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:todo_app/features/notes/models/note_model.dart';
import 'color_item.dart';

class EditNoteColorsList extends StatelessWidget {
  final NoteModel note;

  const EditNoteColorsList({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<EditNoteCubit>(context);
        return SizedBox(
          height: height(context) * 0.1,
          child: ListView.builder(
            itemCount: AppColors.kColors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(end: width(context) * 0.01),
                child: ColorItem(
                  onTap: () {
                    cubit.changeIndex(note: note, index: index);
                  },
                  color: AppColors.kColors[index],
                  isActive: cubit.currentIndex == index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
