import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/custom_appbar.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
