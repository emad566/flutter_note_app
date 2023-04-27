part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

// Start Read Note States
class ReadNoteLoading extends NoteState {}
class ReadNoteSuccess extends NoteState {}
class ReadNoteFailure extends NoteState {
  final String errMsg;
  ReadNoteFailure(this.errMsg);
}
// /End Read Note States

// Start Create Note States
class CreateNoteLoading extends NoteState {}
class CreateNoteSuccess extends NoteState {}
class CreateNoteFailure extends NoteState {
  final String errMsg;
  CreateNoteFailure(this.errMsg);
}
// /End Create Note States

// Start Update Note States
class UpdateNoteLoading extends NoteState {}
class UpdateNoteSuccess extends NoteState {}
class UpdateNoteFailure extends NoteState {
  final String errMsg;
  UpdateNoteFailure(this.errMsg);
}
// /End Update Note States

// Start Delete Note States
class DeleteNoteLoading extends NoteState {}
class DeleteNoteSuccess extends NoteState {}
class DeleteNoteFailure extends NoteState {
  final String errMsg;
  DeleteNoteFailure(this.errMsg);
}
// /End Delete Note States