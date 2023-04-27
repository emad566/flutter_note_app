import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/add_note_bottom_sheet.dart';
import 'package:get/get.dart';

FloatingActionButton buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
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
  );
}