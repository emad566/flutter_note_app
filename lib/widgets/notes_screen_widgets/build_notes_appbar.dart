import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/theme_colors.dart';
import 'package:flutter_note_app/widgets/build_appbar.dart';
import 'package:flutter_note_app/widgets/notes_screen_widgets/custom_search_icon.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildNoteAppBar(BuildContext context, {required Function setState}) {
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