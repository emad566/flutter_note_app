import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/add_note_bottom_sheet.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/build_notes_appbar.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({Key? key}) : super(key: key);

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNoteAppBar(
        isShowLeading: true,
        context,
        setState: setState,
        title: 'Edit Note',
        icon: Icons.done,
        onTab: () {},

      ),
      body: AddNoteBottomSheet(
        isEdit: true,
        contentController: _contentController,
        titleController: _titleController,
        formKey: formKey,
      ),
    );
  }
}



