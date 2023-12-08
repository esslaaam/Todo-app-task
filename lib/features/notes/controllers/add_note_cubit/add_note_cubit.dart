import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/features/notes/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  final GlobalKey<FormState> formKey = GlobalKey();

  final titleCtrl = TextEditingController();
  final subTitleCtrl = TextEditingController();

  int currentIndex = 0;

  Color? color;

  void changeIndex({required int index}) {
    currentIndex = index;
    color = AppColors.kColors[currentIndex];
    emit(ChangeColorIndex());
  }

  void addNote({required NoteModel note}) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  String formattedCurrentDate = '';
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void saveAndAddNote() {
    if (formKey.currentState!.validate()) {
      var now = DateTime.now();
      formattedCurrentDate = DateFormat('dd-MM-yyyy \t hh:mm a').format(now);
      addNote(note: NoteModel(
              title: titleCtrl.text,
              subTitle: subTitleCtrl.text,
              date: formattedCurrentDate,
              color: currentIndex == 0
                  ? AppColors.kColors[currentIndex].value
                  : color!.value));
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
    emit(ChangeStatus());
  }
}
