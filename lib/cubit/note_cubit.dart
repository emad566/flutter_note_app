import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:flutter_note_app/shared/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static get(context) => Provider.of<NoteCubit>(context);

  void createNote(NoteModel note) async{
    try{
      emit(CreateNoteLoading());
      Box notesBox = Hive.box<NoteModel>(Caches.kHiveNotesBox);
      await notesBox.add(note);
      emit(CreateNoteSuccess());
    }catch (e){
      emit(CreateNoteFailure(e.toString()));
    }
  }
}
