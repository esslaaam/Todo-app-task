import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/my_navigate.dart';
import 'package:todo_app/features/notes/controllers/notes_cubit/notes_cubit.dart';
import 'package:todo_app/features/notes/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  final GlobalKey<FormState> formKey = GlobalKey();

  final titleCtrl = TextEditingController();
  final subTitleCtrl = TextEditingController();

  late int currentIndex;

  void changeIndex({required NoteModel note, required int index}) {
    currentIndex = index;
    note.color = AppColors.kColors[currentIndex].value;
    emit(ChangeColorIndex());
  }

  void getNoteDetails({required NoteModel note}) {
    emit(GetNoteLoading());
    currentIndex = AppColors.kColors.indexOf(Color(note.color));
    titleCtrl.text = note.title;
    subTitleCtrl.text = note.subTitle;
    emit(GetNoteSuccess());
  }

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void editNote({required NoteModel note,required BuildContext? context}) async {
    if (formKey.currentState!.validate()) {
      var now = DateTime.now();
      var formattedCurrentDate = DateFormat('dd-MM-yyyy \t hh:mm a').format(now);
      note.title = titleCtrl.text;
      note.subTitle = subTitleCtrl.text;
      note.date = formattedCurrentDate;
      await note.save();
      BlocProvider.of<NotesCubit>(context!).fetchAllNotes();
      if(context.mounted){
        navigatorPop(context: context);
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
    emit(ChangeStatusAndEditNote());
  }
}
