import 'package:flutter/material.dart';
import 'package:flutter_note_app/cubit/note_cubit.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/add_note_bottom_sheet.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/build_notes_appbar.dart';
import 'package:get/get.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({super.key, required this.noteEdit});

  final NoteModel noteEdit;

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNoteAppBar(
        isShowLeading: true,
        context,
        setState: setState,
        title: 'Edit Note',
        icon: Icons.done,
        onTab: () {
          submitEditNote(context);
        },

      ),
      body: AddNoteBottomSheet(noteEdit: widget.noteEdit),
    );
  }

  void submitEditNote(BuildContext context) {
    if (NoteAddForm.formKey.currentState!.validate()) {
      widget.noteEdit.title = NoteAddForm.titleController.text;
      widget.noteEdit.subTitle = NoteAddForm.contentController.text;
      widget.noteEdit.save();
      NoteCubit.get(context).readNotes();
      Get.back();
    } else {

    }
  }
}



