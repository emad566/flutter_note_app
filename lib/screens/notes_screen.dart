import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/add_note_float_action_button.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/build_notes_appbar.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/note_screen_body.dart';


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
      floatingActionButton: buildFloatingActionButton(context),
      body: const NotesScreenBody(),
    );
  }
}



