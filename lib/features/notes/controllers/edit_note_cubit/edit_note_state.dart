part of 'edit_note_cubit.dart';

@immutable
abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {}

class ChangeColorIndex extends EditNoteState {}

class GetNoteLoading extends EditNoteState {}
class GetNoteSuccess extends EditNoteState {}
class ChangeStatusAndEditNote extends EditNoteState {}
