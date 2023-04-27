import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/add_note_bottom_sheet.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/build_notes_appbar.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/note_screen_body.dart';
import 'package:get/get.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNoteAppBar(
        context,
        setState: setState,
        title: 'Note',
        icon: Icons.search,
        onTab: (){},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.colorScheme.background,
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: context.theme.colorScheme.background.withOpacity(0.9),
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesScreenBody(),
    );
  }
}



