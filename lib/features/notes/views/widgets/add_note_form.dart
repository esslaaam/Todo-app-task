import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/notes/controllers/add_note_cubit/add_note_cubit.dart';
import 'colors_list_view.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AddNoteCubit>(context);
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autoValidateMode,
          child: Column(
            children: [
              SizedBox(
                height: height(context) * 0.03,
              ),
              CustomTextField(
                controller: cubit.titleCtrl,
                hint: "Title",
              ),
              SizedBox(
                height: height(context) * 0.02,
              ),
              CustomTextField(
                controller: cubit.subTitleCtrl,
                hint: "Content",
                maxLines: 5,
              ),
              SizedBox(
                height: height(context) * 0.04,
              ),
              const ColorsListView(),
              SizedBox(
                height: height(context) * 0.04,
              ),
              CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  cubit.saveAndAddNote();
                },
              ),
              SizedBox(
                height: height(context) * 0.02,
              ),
            ],
          ),
        );
      },
    );
  }
}
