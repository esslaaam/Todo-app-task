import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/notes/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:todo_app/features/notes/models/note_model.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatelessWidget {
  final NoteModel note;
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<EditNoteCubit>(context);
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.025),
            child: Column(
              children: [
                CustomAppBar(
                  onPressed: () {
                    cubit.editNote(context: context,note: note);
                  },
                  title: 'Edit Note',
                  icon: Icons.check,
                ),
                SizedBox(
                  height: height(context) * 0.01,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsetsDirectional.only(top: height(context)*0.04),
                    child: Form(
                      key: cubit.formKey,
                      autovalidateMode: cubit.autoValidateMode,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: cubit.titleCtrl,
                            hint: "Title",
                          ),
                          SizedBox(
                            height: height(context) * 0.016,
                          ),
                          CustomTextField(
                            controller: cubit.subTitleCtrl,
                            hint: "Content",
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: height(context) * 0.025,
                          ),
                          EditNoteColorsList(
                            note: note,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
