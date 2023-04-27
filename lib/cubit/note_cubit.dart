import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:flutter_note_app/shared/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of<NoteCubit>(context);
  static ScrollController listNotesScrollController = ScrollController();


  Future<void> createNote(NoteModel note) async{
    try{
      emit(CreateNoteLoading());
      Box notesBox = Hive.box<NoteModel>(Caches.kHiveNotesBox);
      await notesBox.add(note);
      emit(CreateNoteSuccess());
      readNotes();
    }catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
      emit(CreateNoteFailure(e.toString()));
    }
  }

  List<NoteModel> readNotes(){
    try{
      emit(ReadNoteLoading());
      Box notesBox = Hive.box<NoteModel>(Caches.kHiveNotesBox);
      List<NoteModel> list = notesBox.values.toList() as List<NoteModel>;
      emit(ReadNoteSuccess(list));
      return list;
    }catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ReadNoteFailure(e.toString()));
    }

    return [];
  }
}
