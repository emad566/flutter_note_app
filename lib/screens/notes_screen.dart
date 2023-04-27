import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
import 'package:flutter_note_app/widgets/build_appbar.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/custom_search_icon.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/note_item.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNoteAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            NoteItem(),
          ],
        ),
      ),
    );
  }

  AppBar buildNoteAppBar(BuildContext context) {
    return buildAppBar(
      setState: setState,
      context: context,
      actionRow: Row(
        children: [
          Text(
            'Notes',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: ThemeColors.appBarFrontText,
                  fontSize: 28,
              ),
            ),
          ),
          const Spacer(),
          const CustomSearchIcon(),
          const SizedBox(width: 8,),
        ],
      )
    );
  }
}
